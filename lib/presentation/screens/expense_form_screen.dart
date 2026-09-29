import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/error/result.dart';
import '../../di/providers.dart';
import '../../domain/entities/expense_entry.dart';
import '../../domain/entities/product.dart';

class ExpenseFormScreen extends ConsumerStatefulWidget {
  final ExpenseEntry? initial;
  const ExpenseFormScreen({super.key, this.initial});

  @override
  ConsumerState<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends ConsumerState<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amount;
  late final TextEditingController _note;
  late String? _category;
  late DateTime _date;
  bool _submitting = false;

  bool get _isEdit => widget.initial != null;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _amount = TextEditingController(
      text: initial == null ? '' : initial.amount.toStringAsFixed(0),
    );
    _note = TextEditingController(text: initial?.note ?? '');
    _category = initial?.category;
    _date = initial?.date ?? DateTime.now();
  }

  @override
  void dispose() {
    _amount.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_category == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Pick a category.')));
      return;
    }

    setState(() => _submitting = true);

    final entry = ExpenseEntry(
      id: widget.initial?.id,
      amount: double.parse(_amount.text.trim()),
      category: _category!,
      date: _date,
      note: _note.text.trim(),
    );

    final controller = ref.read(expensesControllerProvider.notifier);
    final result = _isEdit
        ? await controller.edit(entry)
        : await controller.add(entry);

    if (!mounted) return;

    result.fold(
      onOk: (_) => context.pop(),
      onErr: (f) {
        setState(() => _submitting = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(f.message)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final catalogState = ref.watch(catalogControllerProvider).value;
    final categories = <String>{
      for (final p in catalogState?.items ?? const <Product>[]) p.category,
      // Include the current entry's category even if it was pruned from
      // the catalog — otherwise editing breaks the dropdown.
      if (_category != null) _category!,
    }.toList()..sort();

    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit expense' : 'New expense')),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _amount,
              enabled: !_submitting,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.attach_money),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Amount is required';
                }
                final n = double.tryParse(v.trim());
                if (n == null) return 'Enter a valid number';
                if (n <= 0) return 'Amount must be greater than zero';
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _category,
              items: [
                for (final c in categories)
                  DropdownMenuItem(value: c, child: Text(c)),
              ],
              onChanged: _submitting
                  ? null
                  : (v) => setState(() => _category = v),
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category_outlined),
              ),
              validator: (v) => v == null ? 'Category is required' : null,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _submitting
                  ? null
                  : () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _date,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) setState(() => _date = picked);
                    },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(
                  '${_date.year}-'
                  '${_date.month.toString().padLeft(2, '0')}-'
                  '${_date.day.toString().padLeft(2, '0')}',
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _note,
              enabled: !_submitting,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Note (optional)',
                prefixIcon: Icon(Icons.notes_outlined),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _submitting ? null : _save,
              icon: _submitting
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: Text(
                _submitting
                    ? 'Saving…'
                    : (_isEdit ? 'Save changes' : 'Save expense'),
              ),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
