import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _fileName = 'pocket_ledger.db';
  static const _version = 2;

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
            userId    INTEGER NOT NULL,
            amount    REAL    NOT NULL,
            category  TEXT    NOT NULL,
            date      TEXT    NOT NULL,
            note      TEXT    NOT NULL DEFAULT ''
          )
        ''');
        await db.execute(
          'CREATE INDEX idx_expenses_user_date ON expenses(userId, date)',
        );
        await db.execute(
          'CREATE INDEX idx_expenses_user_category ON expenses(userId, category)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Existing rows predate per-user scoping. Attribute them to
          // userId = 0 ("legacy user"); they'll never match a real session.
          await db.execute(
            'ALTER TABLE expenses ADD COLUMN userId INTEGER NOT NULL DEFAULT 0',
          );
          await db.execute('DROP INDEX IF EXISTS idx_expenses_date');
          await db.execute('DROP INDEX IF EXISTS idx_expenses_category');
          await db.execute(
            'CREATE INDEX idx_expenses_user_date ON expenses(userId, date)',
          );
          await db.execute(
            'CREATE INDEX idx_expenses_user_category ON expenses(userId, category)',
          );
        }
      },
    );
  }
}
