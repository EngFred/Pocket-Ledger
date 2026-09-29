import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../entities/expense_entry.dart';
import '../repositories/expense_repository.dart';

class GetExpenses {
  final ExpenseRepository _repo;
  const GetExpenses(this._repo);
  Future<Result<List<ExpenseEntry>>> call() => _repo.getAll();
}

class AddExpense {
  final ExpenseRepository _repo;
  const AddExpense(this._repo);

  Future<Result<int>> call(ExpenseEntry entry) {
    if (entry.amount <= 0) {
      return Future.value(
        const Err(StorageFailure('Amount must be greater than zero.')),
      );
    }
    return _repo.insert(entry);
  }
}

class DeleteExpense {
  final ExpenseRepository _repo;
  const DeleteExpense(this._repo);
  Future<Result<void>> call(int id) => _repo.delete(id);
}

class GetMonthlySummary {
  final ExpenseRepository _repo;
  const GetMonthlySummary(this._repo);
  Future<Result<MonthlySummary>> call(DateTime month) =>
      _repo.summaryForMonth(month);
}
