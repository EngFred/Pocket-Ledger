import '../../core/error/result.dart';
import '../entities/expense_entry.dart';

abstract interface class ExpenseRepository {
  Future<Result<List<ExpenseEntry>>> getAll();
  Future<Result<int>> insert(ExpenseEntry entry);
  Future<Result<void>> delete(int id);
  Future<Result<MonthlySummary>> summaryForMonth(DateTime month);
}
