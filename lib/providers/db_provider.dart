import 'dart:io' as io;
import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

import 'package:qrscanner/models/scan_models.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  DBHelper.internal();
  factory DBHelper() => _instance;

  static Database? _db;

  Future<Database?> get database async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }
}

Future<Database> initDB() async {
  io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'ScanDB.db');
  print(path);
  Database db = await openDatabase(path, version: 2, onCreate: _createTables);

  print('[DBHelper] initDB: sucess');

  return db;
}

String createTableScans = "CREATE TABLE Scans(id int primary key)";
void _createTables(Database db, int version) async {
  await db.execute(createTableScans);

  print('[DBHELPER] _createTables: Sucess');
}
