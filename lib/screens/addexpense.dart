import 'package:flutter/material.dart';
import 'trip_wallet.dart';

class AddExpensePage extends StatefulWidget {
  final String destination;
  final String duration;
  final double userBudget;

  const AddExpensePage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
  });

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String selectedCategory = 'Food';

  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController =
  TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'icon': Icons.restaurant},
    {'name': 'Transport', 'icon': Icons.directions_bus},
    {'name': 'Activities', 'icon': Icons.local_activity},
    {'name': 'Shopping', 'icon': Icons.shopping_bag},
    {'name': 'Accommodation', 'icon': Icons.hotel},
    {'name': 'Other', 'icon': Icons.grid_view},
  ];

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addExpense() {
    final amount = double.tryParse(amountController.text.trim());

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid amount'),
        ),
      );
      return;
    }

    final description = descriptionController.text.trim().isEmpty
        ? selectedCategory
        : descriptionController.text.trim();

    final expense = {
      'category': selectedCategory,
      'description': description,
      'amount': amount,
      'date': 'Today',
    };

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TripWalletPage(
          destination: widget.destination,
          duration: widget.duration,
          userBudget: widget.userBudget,
          newExpense: expense,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CATEGORY',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];

                final isSelected =
                    selectedCategory == cat['name'];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = cat['name'];
                    });
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE0F2F1)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF00796B)
                            : Colors.transparent,
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          cat['icon'],
                          size: 18,
                          color: isSelected
                              ? const Color(0xFF00796B)
                              : Colors.grey,
                        ),

                        const SizedBox(height: 4),

                        Text(
                          cat['name'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? const Color(0xFF00796B)
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'AMOUNT',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            TextField(
              controller: amountController,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                hintText: '₹ 0',
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: Color(0xFF00796B)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'DESCRIPTION',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 6),

            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'What did you spend on?',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'QUICK AMOUNTS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              children: ['₹ 100', '₹ 250', '₹ 500', '₹ 1,000', '₹ 2,000']
                  .map(
                    (amt) => GestureDetector(
                  onTap: () {
                    amountController.text = amt
                        .replaceAll('₹ ', '')
                        .replaceAll(',', '');
                  },
                  child: Chip(
                    label: Text(
                      amt,
                      style: const TextStyle(fontSize: 10),
                    ),
                    backgroundColor: Colors.grey.shade100,
                  ),
                ),
              )
                  .toList(),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: addExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B),
                ),
                child: const Text(
                  'Add Expense',
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
}