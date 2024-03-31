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
      create: (ctx) => TaskProvider(),
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
        title: Row(
          children: [const Text('All tasks'), ButtonAddict()],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<TaskProvider>(context,listen: false).loadTasks(),
        builder:(ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting? const Center(child: CircularProgressIndicator()): Consumer<TaskProvider>(
          child: const Center(child: Text('Nenhuma tarefa cadastrada')),
          builder: (ctx, tasksPlaces, ch) {
            return tasksPlaces.itemsCount == 0
                ? ch!
                : ListView.builder(
                    itemCount: tasksPlaces.itemsCount,
                    itemBuilder: (ctx, i) => ListTile(
                      leading: Text(tasksPlaces.itemByIndex(i).data.toString()),
                      title: Text(tasksPlaces.itemByIndex(i).title!),
                      onTap: (){},
                    ));
          },
        ),
      ),
    );
  }
}

