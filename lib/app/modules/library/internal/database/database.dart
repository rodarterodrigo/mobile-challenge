import 'package:mobile_challenge/app/modules/library/internal/settings/initial_library_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvidder {

  DBProvidder._();

  static final DBProvidder db = DBProvidder._();
  Database _database;

  factory DBProvidder() {
    return db;
  }

  Future<Database> get database async {
    if(_database != null) return _database;
    return _database = await initDB();
  }

  initDB() async {
    final dbpath = await getDatabasesPath();
    final localdb = join(dbpath, 'mobilechallenge.db');
    // deleteDatabase(localdb);
    return await openDatabase(localdb, version: 1, onOpen: (db) async {
    }, onCreate: (Database db, int version) async {
      await db.execute(initialLibraryTable);
    });
  }
}