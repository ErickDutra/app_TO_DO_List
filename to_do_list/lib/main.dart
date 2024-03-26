import 'package:flutter/material.dart';

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
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Container(
                  child: Center(
                    child: Text("To do List"),
                  ),
                )),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.calendar_view_day)),
                  Text("- Day"),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TasksDay()));
              },
            ),
            Divider(color: Colors.black38),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.calendar_view_week)),
                  Text("- Week"),
                ],
              ),
              onTap: () {},
            ),
            Divider(color: Colors.black38),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.calendar_view_month)),
                  Text("- Month"),
                ],
              ),
              onTap: () {},
            ),
            Divider(color: Colors.black38),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.calendar_today)),
                  Text("- Year"),
                ],
              ),
              onTap: () {},
            ),
            Divider(color: Colors.black38),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à Página Inicial!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class TasksDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adicione o conteúdo do seu widget TasksDay aqui
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tarefas do Dia',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          // Adicione aqui a lista de tarefas do dia
          Text('1. Tarefa 1'),
          Text('2. Tarefa 2'),
          Text('3. Tarefa 3'),
          // Adicione mais tarefas conforme necessário
        ],
      ),
    );
  }
}
