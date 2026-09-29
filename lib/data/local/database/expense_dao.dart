import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/expense_entry.dart';

class ExpenseDao {
  final Database _db;
  final int _userId;
  const ExpenseDao(this._db, {required int userId}) : _userId = userId;

  static const _table = 'expenses';

  Future<List<ExpenseEntry>> getAll() async {
    final rows = await _db.query(
      _table,
      where: 'userId = ?',
      whereArgs: [_userId],
      orderBy: 'date DESC, id DESC',
    );
    return rows.map(_fromRow).toList(growable: false);
  }

  Future<int> insert(ExpenseEntry entry) {
    return _db.insert(_table, {
      'userId': _userId,
      'amount': entry.amount,
      'category': entry.category,
      'date': entry.date.toIso8601String(),
      'note': entry.note,
    });
  }

  /// Returns the number of rows changed (0 if not found or not owned).
  Future<int> update(ExpenseEntry entry) {
    assert(entry.id != null, 'Cannot update an unsaved entry');
    return _db.update(
      _table,
      {
        'amount': entry.amount,
        'category': entry.category,
        'date': entry.date.toIso8601String(),
        'note': entry.note,
      },
      where: 'id = ? AND userId = ?',
      whereArgs: [entry.id, _userId],
    );
  }

  Future<int> delete(int id) => _db.delete(
    _table,
    where: 'id = ? AND userId = ?',
    whereArgs: [id, _userId],
  );

  Future<MonthlySummary> summaryForMonth(DateTime month) async {
    final start = DateTime(month.year, month.month, 1);
    final end = DateTime(month.year, month.month + 1, 1);

    final rows = await _db.rawQuery(
      '''
      SELECT category,
             SUM(amount) AS total
      FROM $_table
      WHERE userId = ? AND date >= ? AND date < ?
      GROUP BY category
      ORDER BY total DESC
      ''',
      [_userId, start.toIso8601String(), end.toIso8601String()],
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
