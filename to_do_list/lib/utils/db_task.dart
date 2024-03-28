import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbTasks {
  static Future<sql.Database> database() async {
    const tableName = 'db_tasks';
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'todos.db'),
      onCreate: (db, version) {
        return db.execute('''
           CREATE TABLE IF NOT EXISTS db_tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            week BOOLEAN,
            month BOOLEAN,
            year BOOLEAN,
            data TEXT,
            description TEXT NOT NULL
          )
''');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbTasks.database();
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbTasks.database();
    return db.query(table);
  }
}
