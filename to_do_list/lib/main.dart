import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            children: [const Text('All tasks')],
          ),
        ),
        body: const TaskList(),
        floatingActionButton: Container(
          child: Center(child: ButtonAddict()),
        ));
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  String capitalize(String text) {
    if (text == null || text.isEmpty) {
      return text;
    }

    return text.split(' ').map((word) {
      final String firstLetter = word.isNotEmpty ? word[0].toUpperCase() : '';
      final String remainingLetters = word.length > 1 ? word.substring(1) : '';
      return firstLetter + remainingLetters;
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Provider.of<TaskProvider>(context, listen: false).loadTasks(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<TaskProvider>(
                child: const Center(child: Text('Nenhuma tarefa cadastrada')),
                builder: (ctx, tasksPlaces, ch) {
                  return tasksPlaces.itemsCount == 0
                      ? ch!
                      : ListView.builder(
                          itemCount: tasksPlaces.itemsCount,
                          itemBuilder: (ctx, i) => ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    tasksPlaces.itemByIndex(i).data != null
                                        ? DateFormat('dd/MM/yyyy').format(
                                            tasksPlaces.itemByIndex(i).data!)
                                        : 'No date',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Center(
                                      child: Text(
                                        capitalize(
                                            tasksPlaces.itemByIndex(i).title!),
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                },
              ),
      ),
    );
  }
}
