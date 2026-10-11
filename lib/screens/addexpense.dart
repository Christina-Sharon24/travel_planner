
import 'package:flutter/material.dart';
import 'trip_wallet.dart';

class AddExpensePage extends StatefulWidget {
  final String destination;
  final String duration;
  final double userBudget;

  // Expenses already recorded for this trip.
  final List<Map<String, dynamic>> expenses;

  const AddExpensePage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
    this.expenses = const [],
  });

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  // SafeTrail theme
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color card = Color(0xFFFFFDFC);
  static const Color text = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color border = Color(0xFFE7DFD8);

  String selectedCategory = 'Food';

  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController =
  TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'icon': Icons.restaurant_outlined},
    {'name': 'Transport', 'icon': Icons.directions_bus_outlined},
    {'name': 'Activities', 'icon': Icons.local_activity_outlined},
    {'name': 'Shopping', 'icon': Icons.shopping_bag_outlined},
    {'name': 'Accommodation', 'icon': Icons.hotel_outlined},
    {'name': 'Other', 'icon': Icons.grid_view_rounded},
  ];

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addExpense() {
    final amount = double.tryParse(amountController.text.trim());

    if (amount == null || !amount.isFinite || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid amount.'),
          backgroundColor: primary,
        ),
      );
      return;
    }

    final description = descriptionController.text.trim().isEmpty
        ? selectedCategory
        : descriptionController.text.trim();

    final expense = <String, dynamic>{
      'category': selectedCategory,
      'description': description,
      'amount': amount,
      'date': 'Today',
    };

    // Copy the existing list before adding the new expense.
    final updatedExpenses = widget.expenses
        .map((item) => Map<String, dynamic>.from(item))
        .toList();

    updatedExpenses.add(expense);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TripWalletPage(
          destination: widget.destination,
          duration: widget.duration,
          userBudget: widget.userBudget,
          expenses: updatedExpenses,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Add Expense',
          style: TextStyle(
            color: text,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Track your spending',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Record an expense for your trip.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFDCCBCB),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              _sectionLabel('CATEGORY'),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.15,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = selectedCategory == cat['name'];

                  return InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      setState(() {
                        selectedCategory = cat['name'] as String;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? primary.withOpacity(0.09)
                            : card,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? primary : border,
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            cat['icon'] as IconData,
                            size: 23,
                            color: isSelected ? primary : accent,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ),
                            child: Text(
                              cat['name'] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isSelected ? primary : text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 26),
              _sectionLabel('AMOUNT'),
              const SizedBox(height: 10),
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: text,
                ),
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  prefixStyle: const TextStyle(
                    color: primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  hintText: 'Enter expense amount',
                  hintStyle: const TextStyle(
                    color: secondaryText,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: card,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 17,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _sectionLabel('DESCRIPTION'),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 2,
                style: const TextStyle(color: text),
                decoration: InputDecoration(
                  hintText: 'What did you spend on?',
                  hintStyle: const TextStyle(
                    color: secondaryText,
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: card,
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              _sectionLabel('QUICK AMOUNTS'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 9,
                runSpacing: 9,
                children: [100, 250, 500, 1000, 2000].map((amount) {
                  return ActionChip(
                    label: Text(
                      '₹$amount',
                      style: const TextStyle(
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: card,
                    side: const BorderSide(color: border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      setState(() {
                        amountController.text = amount.toString();
                        amountController.selection =
                            TextSelection.collapsed(
                              offset: amountController.text.length,
                            );
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: addExpense,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Expense',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 9),
                      Icon(Icons.add_rounded, size: 21),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
        color: secondaryText,
      ),
    );
  }
}
