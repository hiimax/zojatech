
import 'package:zojatech/res/import/import.dart';
import 'dart:io' as io;

 class TransactionDataBase {
  Database? _database;


  String databaseName = 'transaction.db';
  static const int versionNumber = 1;
  String tableNotes = 'Users';
  String colId = 'id';
  String colDate = 'date';
  String colDescription = 'description';
  String colTitle = 'title';
  String colType = 'type';
  String colStatus = 'status';
  String colAmount = 'amount';


  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    var db =
        await openDatabase(path, version: versionNumber, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE IF NOT EXISTS $tableNotes ("
        "$colId INTEGER PRIMARY KEY,"
        "$colDate TEXT,"
        "$colDescription TEXT,"
        "$colTitle TEXT,"
        "$colType TEXT,"
        "$colStatus TEXT,"
        "$colAmount TEXT"
        ")");
  }

  Future<List<TransactionModel>> getAll() async {
    final db = await database;
    final result = await db.query(tableNotes, orderBy: '$colDate DESC');
    return result.map((json) => TransactionModel.fromJson(json)).toList();
  }

  Future<TransactionModel?> read(int id) async {
    final db = await database;
    final maps = await db.query(
      tableNotes,
      where: '$colId = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TransactionModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> insert(TransactionModel note) async {
    final db = await database;
    await db.insert(tableNotes, note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(TransactionModel note) async {
    final db = await database;
    var res = await db.update(tableNotes, note.toJson(),
        where: '$colId = ?', whereArgs: [note.id]);
    return res;
  }

  Future<void> delete(int id) async {
    final db = await database;
    try {
      await db.delete(tableNotes, where: "$colId = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
