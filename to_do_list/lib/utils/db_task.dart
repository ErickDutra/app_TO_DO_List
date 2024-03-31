import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbTasks {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'todos.db'),
      onCreate: (db, version) {
        print('aqui create data');
        return db.execute('''
           CREATE TABLE IF NOT EXISTS todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
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
    print('aqui insert');
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    print("aqui getdata");
    final db = await DbTasks.database();
    return db.query(table);
  }
}
