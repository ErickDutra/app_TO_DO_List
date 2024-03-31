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
              week: item['week'],
              month: item['month'],
              year: item['year'],
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

  void addItem(String title, String description, DateTime time, bool isweek,
      bool ismonth, bool isyear) {
    final newItem = Task(
      id: Random().nextInt(30000),
      title: title,
      description: description,
      week: isweek ? 1 : 0,
      month: ismonth ? 1 : 0,
      year: isyear ? 1 : 0,
      data: DateTime.now(),
    );

    _items.add(newItem);
    DbTasks.insert('todos', {
      'id': newItem.id,
      'title': newItem.title,
      'description': newItem.description,
      'week': newItem.week,
      'month': newItem.month,
      'year': newItem.year,
      'data': newItem.data.toString()
    });
    print('aqui additem');
    notifyListeners();
  }

}
