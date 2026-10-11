import 'package:flutter/material.dart';

import 'trip_summary.dart';
import 'addexpense.dart';

class TripWalletPage extends StatelessWidget {
  final String destination;
  final String duration;
  final double userBudget;

  // All expenses recorded for this trip.
  final List<Map<String, dynamic>> expenses;

  const TripWalletPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
    this.expenses = const [],
  });

  // Convert supported numeric values safely to double.
  double _getAmount(Map<String, dynamic> expense) {
    final amount = expense['amount'];

    if (amount is num) {
      return amount.toDouble();
    }

    return double.tryParse(amount?.toString() ?? '') ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total of every recorded expense.
    final double spent = expenses.fold<double>(
      0.0,
      (total, expense) => total + _getAmount(expense),
    );

    final double remaining = userBudget - spent;
    final double progress = userBudget > 0
        ? (spent / userBudget).clamp(0.0, 1.0)
        : 0.0;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F3),
      appBar: AppBar(
        title: const Text(
          'Trip Wallet',
          style: TextStyle(
            color: Color(0xFF292524),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFFFAF7F3),
        foregroundColor: const Color(0xFF292524),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$destination • $duration',
                style: const TextStyle(color: Color(0xFF78716C), fontSize: 13),
              ),
              const SizedBox(height: 18),

              // Budget overview.
              Row(
                children: [
                  _buildBudgetBox(
                    'PLANNED',
                    '₹${userBudget.toStringAsFixed(0)}',
                    const Color(0xFFE8D5B5),
                    const Color(0xFF6D3B47),
                  ),
                  const SizedBox(width: 8),
                  _buildBudgetBox(
                    'SPENT',
                    '₹${spent.toStringAsFixed(0)}',
                    const Color(0xFFF1DFDA),
                    const Color(0xFF6D3B47),
                  ),
                  const SizedBox(width: 8),
                  _buildBudgetBox(
                    'REMAINING',
                    '₹${remaining.toStringAsFixed(0)}',
                    const Color(0xFFECE5DF),
                    const Color(0xFF78716C),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              const Text(
                'SPENDING',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: Color(0xFF78716C),
                ),
              ),
              const SizedBox(height: 12),

              _buildSpendingProgress(
                'Total Spending',
                '₹${spent.toStringAsFixed(0)} / '
                    '₹${userBudget.toStringAsFixed(0)}',
                progress,
                const Color(0xFFC9826B),
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'RECENT EXPENSES',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: Color(0xFF78716C),
                    ),
                  ),
                  Text(
                    '${expenses.length} recorded',
                    style: const TextStyle(
                      color: Color(0xFF78716C),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              if (expenses.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFDFC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE7DFD8)),
                  ),
                  child: const Text(
                    'No expenses added yet. Add your first trip expense below.',
                    style: TextStyle(color: Color(0xFF78716C), fontSize: 13),
                  ),
                )
              else
                ...expenses.reversed.map((expense) {
                  final description =
                      expense['description']?.toString() ?? 'Expense';
                  final category = expense['category']?.toString() ?? 'Other';
                  final amount = _getAmount(expense);
                  final date = expense['date']?.toString() ?? '';

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _buildExpenseTile(
                      description: description,
                      category: category,
                      amount: amount,
                      date: date,
                    ),
                  );
                }),

              const SizedBox(height: 20),

              // Add another expense while retaining existing expenses.
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddExpensePage(
                          destination: destination,
                          duration: duration,
                          userBudget: userBudget,
                          expenses: expenses,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_rounded),
                  label: const Text(
                    'Add Expense',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF6D3B47),
                    side: const BorderSide(color: Color(0xFF6D3B47)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TripSummaryPage(
                          destination: destination,
                          duration: duration,
                          userBudget: userBudget,
                          spent: spent,
                          newExpense: expenses.isNotEmpty
                              ? expenses.last
                              : <String, dynamic>{},
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D3B47),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'View Trip Summary →',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetBox(
    String label,
    String value,
    Color backgroundColor,
    Color textColor,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE7DFD8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
            const SizedBox(height: 7),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpendingProgress(
    String title,
    String subtitle,
    double progress,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE7DFD8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF292524),
                ),
              ),
              Flexible(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF78716C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFE7DFD8),
              color: color,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseTile({
    required String description,
    required String category,
    required double amount,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDFC),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE7DFD8)),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: const Color(0xFFF1DFDA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              color: Color(0xFF6D3B47),
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF292524),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date.isEmpty ? category : '$category • $date',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF78716C),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '₹${amount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xFF6D3B47),
            ),
          ),
        ],
      ),
    );
  }
}
