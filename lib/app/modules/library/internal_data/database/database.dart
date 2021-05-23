import 'package:mobile_challenge/app/modules/library/internal_data/settings/initial_library_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DBProviderAbstraction{
  Future<Database> get database;
  Future initDB();
  Future close();
}

class DBProvidder implements DBProviderAbstraction{

  DBProvidder._();

  static final DBProvidder db = DBProvidder._();
  Database _database;

  factory DBProvidder() => db;

  @override
  Future close() async => db._database.close();

  @override
  Future<Database> get database async => _database != null? _database: _database = await initDB();

  @override
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