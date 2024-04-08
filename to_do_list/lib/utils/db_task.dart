import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbTasks {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'list_task.db'),
      onCreate: (db, version) {
        return db.execute('''
           CREATE TABLE IF NOT EXISTS todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            week INTEGER DEFAULT 0,
            month INTEGER DEFAULT 0,
            year INTEGER DEFAULT 0,
            data TEXT,
            description TEXT NOT NULL
          )
''');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DbTasks.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    
    final db = await DbTasks.database();
    return db.query(table);
  }
}
