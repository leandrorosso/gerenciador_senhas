import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'treinapass.db'),
      onCreate: (db, version) {
        _createDb(db);
      },
      version: 1,
    );
  }

  static void _createDb(sql.Database db) {
    db.execute(""" CREATE TABLE login (id INTEGER PRIMARY KEY AUTOINCREMENT,
     titulo VARCHAR(50), descricao VARCHAR(50), senha TEXT, username VARCHAR(50),
     url VARCHAR(255)) 
     """);
  }

  static Future<void> insertData(
      String table, Map<String, dynamic> data) async {
    final db = await DbUtil.database();
    await db.insert(table, data);
  }
}
