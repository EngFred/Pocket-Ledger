import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/expense_entry.dart';

class ExpenseDao {
  final Database _db;
  const ExpenseDao(this._db);

  static const _table = 'expenses';

  /// All entries, newest first.
  Future<List<ExpenseEntry>> getAll() async {
    final rows = await _db.query(_table, orderBy: 'date DESC, id DESC');
    return rows.map(_fromRow).toList(growable: false);
  }

  Future<int> insert(ExpenseEntry entry) {
    return _db.insert(_table, {
      'amount': entry.amount,
      'category': entry.category,
      'date': entry.date.toIso8601String(),
      'note': entry.note,
    });
  }

  Future<int> delete(int id) =>
      _db.delete(_table, where: 'id = ?', whereArgs: [id]);

  /// One deliberate aggregate query. This is the whole point of picking
  /// SQLite over a key-value store for this table.
  Future<MonthlySummary> summaryForMonth(DateTime month) async {
    final start = DateTime(month.year, month.month, 1);
    final end = DateTime(month.year, month.month + 1, 1);

    final rows = await _db.rawQuery(
      '''
      SELECT category,
             SUM(amount) AS total
      FROM $_table
      WHERE date >= ? AND date < ?
      GROUP BY category
      ORDER BY total DESC
      ''',
      [start.toIso8601String(), end.toIso8601String()],
    );

    final byCategory = rows
        .map(
          (r) => CategoryTotal(
            category: r['category'] as String,
            total: (r['total'] as num).toDouble(),
          ),
        )
        .toList(growable: false);

    final grandTotal = byCategory.fold<double>(0, (acc, c) => acc + c.total);

    return MonthlySummary(
      month: start,
      grandTotal: grandTotal,
      byCategory: byCategory,
    );
  }

  ExpenseEntry _fromRow(Map<String, Object?> row) => ExpenseEntry(
    id: row['id'] as int,
    amount: (row['amount'] as num).toDouble(),
    category: row['category'] as String,
    date: DateTime.parse(row['date'] as String),
    note: (row['note'] as String?) ?? '',
  );
}
