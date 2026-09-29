// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseEntry _$ExpenseEntryFromJson(Map<String, dynamic> json) =>
    _ExpenseEntry(
      id: (json['id'] as num?)?.toInt(),
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$ExpenseEntryToJson(_ExpenseEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'category': instance.category,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };

_CategoryTotal _$CategoryTotalFromJson(Map<String, dynamic> json) =>
    _CategoryTotal(
      category: json['category'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$CategoryTotalToJson(_CategoryTotal instance) =>
    <String, dynamic>{'category': instance.category, 'total': instance.total};

_MonthlySummary _$MonthlySummaryFromJson(Map<String, dynamic> json) =>
    _MonthlySummary(
      month: DateTime.parse(json['month'] as String),
      grandTotal: (json['grandTotal'] as num).toDouble(),
      byCategory: (json['byCategory'] as List<dynamic>)
          .map((e) => CategoryTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MonthlySummaryToJson(_MonthlySummary instance) =>
    <String, dynamic>{
      'month': instance.month.toIso8601String(),
      'grandTotal': instance.grandTotal,
      'byCategory': instance.byCategory,
    };
