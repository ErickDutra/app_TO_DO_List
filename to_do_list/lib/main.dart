import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/components/addict_page.dart';
import 'package:to_do_list/components/draw.dart';
import 'package:to_do_list/provider/tasks_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create:(ctx)=>TasksPlaces(),
      child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const HomePage()),
          
    );
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



