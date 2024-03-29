
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_list/components/todo.dart';

class TasksPlaces with ChangeNotifier {
  List<Task> _items = [];

  List<Task> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Task getItem(int index) {
    return _items[index];
  }

  void addItem(String title, String description, DateTime time, bool isweek,
      bool ismonth, bool isyear) {
    final newItem = Task(
      id: Random().nextInt(30000),
      title: title,
      description: description,
      week: false,
      month: false,
      year: false,
      data: DateTime.now(),
    );

    _items.add(newItem);
    notifyListeners();
  }
}
