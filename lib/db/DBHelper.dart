import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();
  static Database _db;

  factory DBHelper() => _instance;

  DBHelper.internal();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    // so#51384175
    Directory docDir = await getApplicationDocumentsDirectory();
    String dbPath = join(docDir.path, 'qdb.db');
    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join('assets', 'db', 'qdb.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(dbPath).writeAsBytes(bytes);
    }
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    // var count = await db.rawQuery('select count(*) as count from quotes');
    // print('Count: ');
    // print(count[0].toString());
  }

  Future<List> getAllGenre() async {
    var dbClient = await db;
    var result = await dbClient.query('genre', columns: ['id', 'name']);
    return result.toList();
  }
}
