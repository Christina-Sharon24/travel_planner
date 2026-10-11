import 'package:flutter/material.dart';

class TripSummaryPage extends StatelessWidget {
  final String destination;
  final String duration;
  final double userBudget;
  final double spent;
  final Map<String, dynamic> newExpense;

  const TripSummaryPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
    required this.spent,
    required this.newExpense,
  });

  // SafeTrail theme colours
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color cardColor = Color(0xFFFFFDFC);
  static const Color mainText = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color borderColor = Color(0xFFE7DFD8);

  double get remainingBudget => userBudget - spent;

  double get budgetUsage {
    if (userBudget <= 0) return 0;
    return (spent / userBudget).clamp(0.0, 1.0);
  }

  String get budgetStatus {
    if (userBudget <= 0) return 'Budget not set';
    if (spent > userBudget) return 'Over budget';
    if (spent >= userBudget * 0.8) return 'Budget running low';
    return 'Within budget';
  }

  Color get budgetStatusColor {
    if (userBudget <= 0) return secondaryText;
    if (spent > userBudget) return primary;
    if (spent >= userBudget * 0.8) return accent;
    return primary;
  }

  String get _expenseDescription {
    final description = newExpense['description']?.toString().trim() ?? '';
    final category = newExpense['category']?.toString().trim() ?? '';

    if (description.isNotEmpty) return description;
    if (category.isNotEmpty) return category;

    return 'Expense details';
  }

  double get _latestExpenseAmount {
    final amount = newExpense['amount'];

    if (amount is num) {
      return amount.toDouble();
    }

    return double.tryParse(amount?.toString() ?? '') ?? 0;
  }

  String _formatAmount(double amount) {
    return '₹${amount.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: mainText,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Trip Summary',
          style: TextStyle(
            color: mainText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.luggage_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'TRIP SUMMARY READY',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      destination,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white70,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            duration,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'BUDGET OVERVIEW',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              // Budget card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total trip budget',
                      style: TextStyle(color: secondaryText, fontSize: 13),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatAmount(userBudget),
                      style: const TextStyle(
                        color: mainText,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 22),

                    _SummaryRow(
                      icon: Icons.payments_outlined,
                      label: 'Total spent',
                      value: _formatAmount(spent),
                      valueColor: primary,
                    ),

                    const SizedBox(height: 15),

                    _SummaryRow(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'Remaining budget',
                      value: _formatAmount(remainingBudget),
                      valueColor: remainingBudget < 0 ? primary : accent,
                    ),

                    const SizedBox(height: 22),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: budgetUsage,
                        minHeight: 9,
                        backgroundColor: highlight,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          primary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            userBudget > 0
                                ? '${(spent / userBudget * 100).toStringAsFixed(1)}% of budget used'
                                : 'Enter a budget to track spending',
                            style: const TextStyle(
                              color: secondaryText,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          budgetStatus,
                          style: TextStyle(
                            color: budgetStatusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'LATEST EXPENSE',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              // Latest expense card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderColor),
                ),
                child: newExpense.isEmpty
                    ? const Row(
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            color: accent,
                            size: 28,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'No new expense details to display.',
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: highlight.withOpacity(0.45),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Icon(
                              Icons.receipt_long_rounded,
                              color: primary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _expenseDescription,
                                  style: const TextStyle(
                                    color: mainText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  newExpense['category']?.toString() ??
                                      'Expense',
                                  style: const TextStyle(
                                    color: secondaryText,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formatAmount(_latestExpenseAmount),
                            style: const TextStyle(
                              color: primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
              ),

              const SizedBox(height: 24),

              // Budget status card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: highlight.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      spent > userBudget
                          ? Icons.warning_amber_rounded
                          : Icons.lightbulb_outline_rounded,
                      color: primary,
                      size: 25,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            spent > userBudget
                                ? 'You are over budget'
                                : 'Keep track of your spending',
                            style: const TextStyle(
                              color: mainText,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            spent > userBudget
                                ? 'Your expenses exceed your planned budget by ${_formatAmount(spent - userBudget)}.'
                                : 'Review your expenses regularly to help keep your trip within budget.',
                            style: const TextStyle(
                              color: secondaryText,
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Return button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text(
                    'Back',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;

  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: TripSummaryPage.secondaryText, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: TripSummaryPage.secondaryText,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
