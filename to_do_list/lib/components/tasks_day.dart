import 'package:flutter/material.dart';
import 'package:to_do_list/components/draw.dart';
class TasksDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adicione o conteúdo do seu widget TasksDay aqui
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Tasks Day"),),
      body: Container(
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
      ),
    );
  }
}
