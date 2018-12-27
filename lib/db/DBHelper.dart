import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:quotesapp/models/Author.dart';
import 'package:quotesapp/models/Genre.dart';
import 'package:quotesapp/models/Quote.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();
  static Database _db;
  final String _authorTable = 'author';
  final String _quotesTable = 'quotes';
  final String _genreTable = 'genre';
  static const int _LIMIT = 20;
  String author = '(SELECT name from author where id=author_id) as author';
  String genre = '(SELECT name from genre where id=genre_id) as genre';

  factory DBHelper() => _instance;

  DBHelper.internal();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    Sqflite.devSetDebugModeOn(true);
    return _db;
  }

  initDb() async {
    // so#51384175
    Directory docDir = await getApplicationDocumentsDirectory();
    String dbPath = join(docDir.path, 'qdb.db');
    File(dbPath).deleteSync();

    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join('assets', 'db', 'qdb.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(dbPath).writeAsBytes(bytes);
    }
    var db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {}

  Future<List<Genre>> getAllGenre({int limit}) async {
    var dbc = await db;
    List result;
    if (limit != null) {
      result = await dbc.query(_genreTable,
          columns: ['id', 'name', 'weight'],
          orderBy: 'weight DESC',
          limit: limit);
    } else {
      result = await dbc.query(_genreTable, columns: ['id', 'name', 'weight']);
    }
    return result.map((item) => Genre.fromJson(item)).toList();
  }

  Future<List<Author>> getAllAuthors({int isPopular = 0}) async {
    var dbc = await db;
    List res;
    if (isPopular == 1) {
      res = await dbc.query(_authorTable,
          columns: ['id', 'name', 'popular'],
          where: 'popular = ?',
          whereArgs: [1]);
    } else {
      res = await dbc.query(_authorTable, columns: ['id', 'name']);
    }
    return res.map((item) => Author.fromJson(item)).toList();
  }

  Future<List<Quote>> getQuotes(
      {int page = 1, int authorId, int genreId, bool limited = true}) async {
    var dbc = await db;
    var offset = (page - 1) * _LIMIT;

    String cols = 'id,quote,$author,$genre,favorite';

    String _whereClause = '';
    String _limitClause = '';
    if (authorId != null) {
      _whereClause += ' WHERE author_id=$authorId';
      offset = 0;
    }
    if (genreId != null) {
      _whereClause += ' WHERE genre_id=$genreId';
      offset = 0;
    }

    if (limited) {
      _limitClause = 'LIMIT $_LIMIT OFFSET $offset ';
    } else {
      _limitClause = '';
    }

    var q = 'SELECT $cols from $_quotesTable $_whereClause ' + _limitClause;
    var res = await dbc.rawQuery(q);
    return res.map((item) => Quote.fromJson(item)).toList();
  }

  Future<dynamic> getQuoteById({int id}) async {
    var dbc = await db;
    var quote = await dbc.query(_quotesTable,
        columns: ['id', 'quote', author, genre],
        where: 'id=?',
        whereArgs: [id]);
    var quoteList = quote.toList();
    return Quote.fromJson(quoteList[0]);
  }

  Future<int> getQuotesCount() async {
    var dbc = await db;
    return Sqflite.firstIntValue(
        await dbc.rawQuery('SELECT COUNT(*) FROM $_quotesTable'));
  }
}
