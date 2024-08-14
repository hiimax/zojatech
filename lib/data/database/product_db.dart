import 'package:zojatech/res/import/import.dart';
import 'dart:io' as io;

 class ProductDatabase {
  Database? _database;


  String databaseName = 'product.db';
  static const int versionNumber = 1;
  String tableNotes = 'Products';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colStatus = 'status';
  String colCategory = 'category';
  String colDate = 'date';

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
        "$colTitle TEXT,"
        "$colDescription TEXT,"
        "$colStatus TEXT,"
        "$colCategory TEXT,"
        "$colDate TEXT"
        ")");
  }

  Future<List<ProductModel>> getAll() async {
    final db = await database;
    final result = await db.query(tableNotes, orderBy: '$colDate DESC');
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<ProductModel?> read(String column, String value) async {
    final db = await database;
    final maps = await db.query(
      tableNotes,
      where: '$column = ?',
      whereArgs: [value],
    );

    if (maps.isNotEmpty) {
      return ProductModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> insert(ProductModel note) async {
    final db = await database;
    await db.insert(tableNotes, note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(ProductModel note) async {
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
