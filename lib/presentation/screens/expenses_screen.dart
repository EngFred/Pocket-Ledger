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

    // Stable family key: first day of the current month. Every call to
    // DateTime(now.year, now.month) produces an ==-equal DateTime, so the
    // family has exactly one live instance per month instead of one per
    // rebuild. Using raw DateTime.now() as a family key creates a new
    // provider instance on every frame, and none of them ever resolve.
    final now = DateTime.now();
    final monthKey = DateTime(now.year, now.month);
    final summaryAsync = ref.watch(monthlySummaryProvider(monthKey));

    final currencyCode = ref.watch(settingsControllerProvider).currencyCode;

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(Routes.expenseNew),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: switch ((expensesAsync, summaryAsync)) {
        // While either is loading, show one spinner for the whole screen.
        (AsyncLoading(), _) ||
        (_, AsyncLoading()) => const Center(child: CircularProgressIndicator()),

        // Either failing takes over the whole screen — no half-rendered
        // summary with a broken list, or vice versa.
        (AsyncError(:final error), _) => _ErrorPanel(error: error),
        (_, AsyncError(:final error)) => _ErrorPanel(error: error),

        // Both ready — render the real screen.
        (AsyncData(value: final expenses), AsyncData(value: final summary)) =>
          RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(expensesControllerProvider);
              ref.invalidate(monthlySummaryProvider);
            },
            child: ListView(
              padding: const EdgeInsets.only(bottom: 96),
              children: [
                _SummaryCard(summary: summary, currencyCode: currencyCode),
                if (expenses.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 48),
                    child: Center(child: Text('No expenses recorded yet.')),
                  )
                else
                  for (final e in expenses) _ExpenseTile(entry: e),
              ],
            ),
          ),
      },
    );
  }
}

class _ErrorPanel extends StatelessWidget {
  final Object error;
  const _ErrorPanel({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text('$error', textAlign: TextAlign.center),
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
        onTap: () => context.pushNamed(Routes.expenseEdit, extra: entry),
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
