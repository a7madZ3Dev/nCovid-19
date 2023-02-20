import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import '/core/utils/constants.dart';

class DBHelper {
  /// open database
  static Future<Database> getDataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'Data.db'),
        version: 1,
        onCreate: (db, version) => db.execute(
            'CREATE TABLE $kTableName(id INTEGER PRIMARY KEY, $kCountryName TEXT, $kCountryFlag TEXT, $kCountryCases INTEGER, $kCountryDeathes INTEGER,$kCountryActive INTEGER, $kCountryRecovered INTEGER)'));
  }

  /// insert row
  Future<void> insertRow(Map<String, Object> row) async {
    final db = await DBHelper.getDataBase();
    await db.insert(
      kTableName,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace, // for replacing if exist
    );
  }

  /// delete all rows
  Future<void> deleteRows() async {
    final db = await DBHelper.getDataBase();
    await db.execute('DELETE FROM $kTableName');
  }

  /// get all rows
  Future<List<Map<String, dynamic>>> getRows() async {
    final db = await DBHelper.getDataBase();
    return db.query(kTableName);
  }

  /// close database
  Future<void> close() async {
    final db = await DBHelper.getDataBase();
    return db.close();
  }
}
