import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_entry.freezed.dart';
part 'expense_entry.g.dart';

@freezed
abstract class ExpenseEntry with _$ExpenseEntry {
  const factory ExpenseEntry({
    /// null when it hasn't been inserted yet.
    int? id,
    required double amount,
    required String category,
    required DateTime date,
    @Default('') String note,
  }) = _ExpenseEntry;

  factory ExpenseEntry.fromJson(Map<String, dynamic> json) =>
      _$ExpenseEntryFromJson(json);
}

@freezed
abstract class CategoryTotal with _$CategoryTotal {
  const factory CategoryTotal({
    required String category,
    required double total,
  }) = _CategoryTotal;

  factory CategoryTotal.fromJson(Map<String, dynamic> json) =>
      _$CategoryTotalFromJson(json);
}

@freezed
abstract class MonthlySummary with _$MonthlySummary {
  const factory MonthlySummary({
    required DateTime month,
    required double grandTotal,
    required List<CategoryTotal> byCategory,
  }) = _MonthlySummary;

  factory MonthlySummary.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryFromJson(json);
}
