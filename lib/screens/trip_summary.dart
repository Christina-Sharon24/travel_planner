import 'package:flutter/material.dart';

class TripSummaryPage extends StatelessWidget {
  final String destination;
  final String duration;
  final double userBudget;
  final double spent;
  final Map<String, dynamic>? newExpense;

  const TripSummaryPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
    required this.spent,
    this.newExpense,
  });

  @override
  Widget build(BuildContext context) {
    final double remaining =
    userBudget - spent < 0 ? 0 : userBudget - spent;

    final double progress =
    userBudget > 0 ? spent / userBudget : 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),

      appBar: AppBar(
        title: const Text(
          'TRIP SUMMARY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF00796B),
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  destination,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),

                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TRIP BUDGET',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _SummaryRow(
                          label: 'Planned',
                          value:
                          '₹${userBudget.toStringAsFixed(0)}',
                          isBold: true,
                        ),

                        _SummaryRow(
                          label: 'Actual Spent',
                          value:
                          '₹${spent.toStringAsFixed(0)}',
                          color: Colors.redAccent,
                        ),

                        _SummaryRow(
                          label: 'Remaining',
                          value:
                          '₹${remaining.toStringAsFixed(0)}',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'BUDGET USAGE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          '${(progress * 100).clamp(0, 100).toStringAsFixed(0)}% of budget used',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00796B),
                          ),
                        ),

                        const SizedBox(height: 6),

                        LinearProgressIndicator(
                          value: progress > 1 ? 1 : progress,
                          color: const Color(0xFF00796B),
                          backgroundColor:
                          Colors.grey.shade200,
                          minHeight: 6,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LATEST EXPENSE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 10),

                        if (newExpense != null) ...[
                          Text(
                            newExpense!['description'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            '${newExpense!['category']} • ₹${(newExpense!['amount'] as double).toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ] else
                          const Text(
                            'No expense added.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 28,
                        ),

                        SizedBox(height: 6),

                        Text(
                          'TRIP COMPLETE!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                              (route) => route.isFirst,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFF00838F),
                      ),
                      child: const Text(
                        'BACK TO HOME',
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
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? color;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),

          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isBold
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}