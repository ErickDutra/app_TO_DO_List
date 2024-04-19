import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_list/components/todo.dart';
import 'package:to_do_list/utils/db_task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _items = [];

  Future<void> loadTasks() async {
    final dataList = await DbTasks.getData('todos');
    _items = dataList
        .map((item) => Task(
              id: item['id'],
              title: item['title'],
              description: item['description'],
              data: DateTime.parse(item['data']),
            ))
        .toList();
    notifyListeners();
  }

  List<Task> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Task getItem(int index) {
    return _items[index];
  }

  Task itemByIndex(int index) {
    return _items[index];
  }

  void removeItem(Task item) {
    _items.remove(item);
    DbTasks.delete('tasks', item.id);
    notifyListeners();
  }

  void addItem(String title, String description, DateTime time, bool isweek,
      bool ismonth, bool isyear) {
    final newItem = Task(
      id: Random().nextInt(30000),
      title: title,
      description: description,
      data: DateTime.now(),
    );

    _items.add(newItem);
    DbTasks.insert('tasks', {
      'id': newItem.id,
      'title': newItem.title,
      'description': newItem.description,
      'data': newItem.data.toString()
    });
    notifyListeners();
  }

 


}
