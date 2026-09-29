import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../domain/entities/expense_entry.dart';
import '../../domain/repositories/expense_repository.dart';
import '../local/database/expense_dao.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDao _dao;
  const ExpenseRepositoryImpl(this._dao);

  @override
  Future<Result<List<ExpenseEntry>>> getAll() => _run(_dao.getAll);

  @override
  Future<Result<int>> insert(ExpenseEntry entry) =>
      _run(() => _dao.insert(entry));

  @override
  Future<Result<void>> update(ExpenseEntry entry) => _run(() async {
    final rows = await _dao.update(entry);
    if (rows == 0) {
      throw const StorageFailure(
        'This expense could not be updated. It may have been deleted.',
      );
    }
  });

  @override
  Future<Result<void>> delete(int id) => _run(() async {
    await _dao.delete(id);
  });

  @override
  Future<Result<MonthlySummary>> summaryForMonth(DateTime month) =>
      _run(() => _dao.summaryForMonth(month));

  Future<Result<T>> _run<T>(Future<T> Function() body) async {
    try {
      return Ok(await body());
    } on Failure catch (e) {
      return Err(e);
    } catch (_) {
      return const Err(StorageFailure());
    }
  }
}
