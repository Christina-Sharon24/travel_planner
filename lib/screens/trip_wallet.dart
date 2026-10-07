import 'package:flutter/material.dart';
import 'trip_summary.dart';

class TripWalletPage extends StatelessWidget {
  final String destination;
  final String duration;
  final double userBudget;
  final Map<String, dynamic>? newExpense;

  const TripWalletPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
    this.newExpense,
  });

  @override
  Widget build(BuildContext context) {
    final double expenseAmount =
        newExpense?['amount'] ?? 0.0;

    final double spent = expenseAmount;

    final double remaining =
    userBudget - spent < 0 ? 0 : userBudget - spent;

    final double progress =
    userBudget > 0 ? spent / userBudget : 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),

      appBar: AppBar(
        title: const Text(
          'Trip Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$destination • $duration',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _buildBudgetBox(
                  'PLANNED',
                  '₹${userBudget.toStringAsFixed(0)}',
                  const Color(0xFFE8EAF6),
                  Colors.indigo,
                ),

                const SizedBox(width: 8),

                _buildBudgetBox(
                  'SPENT',
                  '₹${spent.toStringAsFixed(0)}',
                  const Color(0xFFFFEBEE),
                  Colors.red,
                ),

                const SizedBox(width: 8),

                _buildBudgetBox(
                  'REMAINING',
                  '₹${remaining.toStringAsFixed(0)}',
                  const Color(0xFFE8F5E9),
                  Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'SPENDING',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            _buildSpendingProgress(
              'Total Spending',
              '₹${spent.toStringAsFixed(0)} / ₹${userBudget.toStringAsFixed(0)}',
              progress > 1 ? 1 : progress,
              Colors.teal,
            ),

            const SizedBox(height: 20),

            const Text(
              'RECENT EXPENSE',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            if (newExpense != null)
              _buildExpenseTile(
                newExpense!['description'],
                newExpense!['category'],
                '₹${expenseAmount.toStringAsFixed(0)}',
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'No expenses added yet.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
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
                        newExpense: newExpense,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B),
                ),
                child: const Text(
                  'View Trip Summary →',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textColor,
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
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade200,
          color: color,
          minHeight: 6,
        ),
      ],
    );
  }

  Widget _buildExpenseTile(
      String description,
      String category,
      String amount,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.receipt_long,
                size: 20,
                color: Color(0xFF00796B),
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Text(
            amount,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}