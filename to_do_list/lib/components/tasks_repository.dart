import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/components/db.dart';
import 'package:to_do_list/components/todo.dart';

import 'package:sqflite/sqflite.dart';

class TaskDB {
  final tableName = 'all_tasks';

  Future<void> createTable(Database database) async {
    await database.execute('''
     CREATE TABLE IF NOT EXISTS $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            day BOOLEAN,
            month BOOLEAN,
            year BOOLEAN,
            data TEXT,
            description TEXT NOT NULL
          )
''');
  }

  Future<void> create({required String title, required bool day, required bool month, required bool year, required String data, required String description}) async {
    final database = await DatabaseService().database;
    await database.rawInsert('''
      INSERT INTO $tableName (titulo, day, month, year, data, description) 
      VALUES(?, ?, ?, ?, ?, ?)
    ''', [title, day ? 1 : 0, month ? 1 : 0, year ? 1 : 0, data, description]);
  }

  Future<List<Task>> fetchAll() async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> maps = await database.query(tableName);

    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        titulo: maps[index]['titulo'],
        day: maps[index]['day'] == 1,
        month: maps[index]['month'] == 1,
        year: maps[index]['year'] == 1,
        data: maps[index]['data'],
        description: maps[index]['description'],
      );
    });
  }

  Future<Task> getTaskById(int id) async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> maps = await database.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    } else {
      throw Exception('Tarefa não encontrada');
    }
  }
   
  
}
