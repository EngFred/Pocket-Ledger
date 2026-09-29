import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _fileName = 'pocket_ledger.db';
  static const _version = 1;

  static Future<Database> open() async {
    final path = p.join(await getDatabasesPath(), _fileName);
    return openDatabase(
      path,
      version: _version,
      onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE expenses (
            id        INTEGER PRIMARY KEY AUTOINCREMENT,
            amount    REAL    NOT NULL,
            category  TEXT    NOT NULL,
            date      TEXT    NOT NULL,
            note      TEXT    NOT NULL DEFAULT ''
          )
        ''');
        await db.execute('CREATE INDEX idx_expenses_date ON expenses(date)');
        await db.execute(
          'CREATE INDEX idx_expenses_category ON expenses(category)',
        );
      },
    );
  }
}
