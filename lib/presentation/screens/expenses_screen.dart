import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../di/providers.dart';
import '../../domain/entities/expense_entry.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesControllerProvider);
    final now = DateTime.now();
    final summaryAsync = ref.watch(monthlySummaryProvider(now));

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(Routes.expenseNew),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(expensesControllerProvider),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 96),
          children: [
            summaryAsync.when(
              loading: () => const SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => const SizedBox.shrink(),
              data: (summary) => _SummaryCard(
                summary: summary,
                currencyCode: ref
                    .watch(settingsControllerProvider)
                    .currencyCode,
              ),
            ),
            expensesAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (err, _) => Padding(
                padding: const EdgeInsets.all(24),
                child: Text('$err', textAlign: TextAlign.center),
              ),
              data: (expenses) {
                if (expenses.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 48),
                    child: Center(child: Text('No expenses recorded yet.')),
                  );
                }
                return Column(
                  children: [for (final e in expenses) _ExpenseTile(entry: e)],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final MonthlySummary summary;
  final String currencyCode;
  const _SummaryCard({required this.summary, required this.currencyCode});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final monthLabel =
        '${summary.month.year}-${summary.month.month.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('This month · $monthLabel', style: text.labelMedium),
            const SizedBox(height: 4),
            Text(
              '$currencyCode ${summary.grandTotal.toStringAsFixed(0)}',
              style: text.headlineMedium?.copyWith(color: scheme.primary),
            ),
            if (summary.byCategory.isNotEmpty) ...[
              const Divider(height: 24),
              for (final c in summary.byCategory)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(child: Text(c.category)),
                      Text(
                        '$currencyCode ${c.total.toStringAsFixed(0)}',
                        style: text.bodyMedium,
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExpenseTile extends ConsumerWidget {
  final ExpenseEntry entry;
  const _ExpenseTile({required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete_outline),
      ),
      onDismissed: (_) {
        if (entry.id != null) {
          ref.read(expensesControllerProvider.notifier).delete(entry.id!);
        }
      },
      child: ListTile(
        title: Text(entry.category),
        subtitle: Text(
          '${entry.date.year}-${entry.date.month.toString().padLeft(2, '0')}-'
          '${entry.date.day.toString().padLeft(2, '0')}'
          '${entry.note.isEmpty ? '' : ' · ${entry.note}'}',
        ),
        trailing: Text(entry.amount.toStringAsFixed(0)),
      ),
    );
  }
}
