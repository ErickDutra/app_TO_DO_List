import 'package:flutter/material.dart';
import 'package:to_do_list/components/draw.dart';
import 'package:to_do_list/components/tasks_repository.dart';
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

class MinhaTela extends StatefulWidget {
  @override
  _MinhaTelaState createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TasksRepository _repository = Provider.of<TasksRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _dataController,
              decoration: InputDecoration(labelText: 'Data'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  id: 0, // O ID será gerado automaticamente pelo banco de dados
                  titulo: _tituloController.text,
                  day: true, // Defina os valores desejados para os campos 'day', 'month' e 'year'
                  month: true,
                  year: true,
                  data: _dataController.text,
                  description: _descricaoController.text,
                );
                _repository.insertTask(newTask); // Insere a nova tarefa no banco de dados
                Navigator.pop(context); // Fecha a tela de adição de tarefa
              },
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}