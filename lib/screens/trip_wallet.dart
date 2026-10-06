import 'package:flutter/material.dart';
import 'trip_summary.dart';

class TripWalletPage extends StatelessWidget {
  final String destination;
  final String duration;
  final double userBudget;

  const TripWalletPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.userBudget,
  });

  @override
  Widget build(BuildContext context) {
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
              '$destination . $duration',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildBudgetBox(
                  'PLANNED',
                  '₹78000',
                  const Color(0xFFE8EAF6),
                  Colors.indigo,
                ),
                const SizedBox(width: 8),
                _buildBudgetBox(
                  'SPENT',
                  '₹31500',
                  const Color(0xFFFFEBEE),
                  Colors.red,
                ),
                const SizedBox(width: 8),
                _buildBudgetBox(
                  'REMAINING',
                  '₹46500',
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
              'Food',
              'Rs 4200/10000',
              0.42,
              Colors.orange,
            ),
            _buildSpendingProgress(
              'Transport',
              'Rs 2100/6000',
              0.35,
              Colors.blue,
            ),
            _buildSpendingProgress(
              'Shopping',
              'Rs 3200/5000',
              0.64,
              Colors.purple,
            ),
            _buildSpendingProgress(
              'Accommodation',
              'Rs 22000/30000',
              0.73,
              Colors.teal,
            ),
            const SizedBox(height: 20),
            const Text(
              'RECENT EXPENSES',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            _buildExpenseTile(
              'Lunch',
              'Today, 1:30 PM',
              'Rs 450',
              Icons.restaurant,
            ),
            _buildExpenseTile(
              'Metro',
              'Today, 11:30 AM',
              'Rs 120',
              Icons.train,
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
      String val,
      Color bg,
      Color textCol,
      ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
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
                color: textCol,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              val,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textCol,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                style: const TextStyle(fontSize: 10, color: Colors.grey),
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
      ),
    );
  }

  Widget _buildExpenseTile(
      String title,
      String time,
      String price,
      IconData icon,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF00796B)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            price,
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