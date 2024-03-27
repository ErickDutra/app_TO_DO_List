import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_list/components/tasks_repository.dart';

class DatabaseService{
  DatabaseService();

  static final DatabaseService instance = DatabaseService();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      version: 1,
      onCreate: create,
    );
  }

  Future<void> create(Database database, int version) async => await TaskDB().createTable(database);
 
}
