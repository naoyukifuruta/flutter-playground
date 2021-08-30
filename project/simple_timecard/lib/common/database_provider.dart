import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  final databaseName = "SimepleTimecard.db";
  final databaseVersion = 1;
  //final migrations = [];

  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database!;
  }

  void _createTable(Batch batch) {
    batch.execute('''
    CREATE TABLE timecard(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      targetAt TEXT NOT NULL,
      start TEXT,
      end TEXT,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
    ''');
  }

  void _dropTable(Batch batch) {
    batch.execute('''
        DROP TABLE IF EXISTS timecard
        ''');
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: databaseVersion,
      onCreate: (db, version) async {
        var batch = db.batch();
        _dropTable(batch); // TODO: 開発中のみ
        _createTable(batch);
        await batch.commit();
      },
      onDowngrade: onDatabaseDowngradeDelete,
      // onUpgrade: (db, oldVersion, newVersion) async {
      //   for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
      //     await db.execute(migrations[i]);
      //   }
      // }
    );
  }
}
