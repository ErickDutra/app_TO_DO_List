import 'package:flutter/material.dart';
import 'package:to_do_list/components/draw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text('All tasks'),
        ),
        body: ButtonAddict());
  }
}

class ButtonAddict extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: IconButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                      elevation: MaterialStateProperty.all<double>(5.0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green), // Defina  cor de fundo desejada aqui
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add)),
              ),
            ],
          ),
        ],
    );
  }
}
