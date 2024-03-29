import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/tasks_places.dart';

class AddictPage extends StatefulWidget {
  @override
  _AddictPageState createState() => _AddictPageState();
}

class _AddictPageState extends State<AddictPage> {
  DateTime selectedDate = DateTime.now();
  bool _isWeek = false;
  bool _isMonth = false;
  bool _isYear = false;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitForm() {
    if (_isWeek && _isMonth && _isYear == false) {
      return;
    }

    if (_titleController.text.isEmpty) {
      return;
    }

    Provider.of<TasksPlaces>(context, listen: false)
        .addItem(_titleController.text, _descriptionController.text, selectedDate, _isWeek, _isMonth, _isYear);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Week'),
                  Checkbox(
                    value: _isWeek,
                    onChanged: (value) {
                      setState(() {
                        _isWeek = value!;
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Month'),
                  Checkbox(
                    value: _isMonth,
                    onChanged: (value) {
                      setState(() {
                        _isMonth = value!;
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Year'),
                  Checkbox(
                    value: _isYear,
                    onChanged: (value) {
                      setState(() {
                        _isYear = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(
                    "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year} "),
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2005),
                      lastDate: DateTime(2030));
                  if (dateTime != null) {
                    setState(() {
                      selectedDate = dateTime;
                    });
                  }
                },
              ),
              ElevatedButton(onPressed: _submitForm, child: Text('Save'))
            ],
          )
        ],
      ),
    );
  }
}

class ButtonAddict extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          height: 300,
                          child: AddictPage(),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.add)),
            ),
          ],
        ),
      ],
    );
  }
}
