import 'package:flutter/material.dart';
import 'package:travel_planner/screens/safety_prep_page.dart';

class TripResultPage6 extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final double userBudget;
  final int travellerCount;

  const TripResultPage6({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.userBudget,
    required this.travellerCount,
  });

  @override
  Widget build(BuildContext context) {
    final double flightCost = userBudget * 0.35 * travellerCount;
    final double foodCost = userBudget * 0.20 * travellerCount;
    final double accommodationCost = userBudget * 0.30;
    final double emergencyCost = userBudget * 0.15;
    final double totalCalculatedExpense =
        flightCost + foodCost + accommodationCost + emergencyCost;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          destination,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00796B),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=1000&q=80',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$duration • $travellers',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ESTIMATED COST BREAKDOWN',
                    style: TextStyle(
                      color: Color(0xFF00796B),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Calculated Expense',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '₹ ${totalCalculatedExpense.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF004D40),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 25),
                        _expenseRow(
                          Icons.flight,
                          'Flight ($travellerCount pax)',
                          '₹ ${flightCost.toStringAsFixed(0)}',
                        ),
                        const SizedBox(height: 12),
                        _expenseRow(
                          Icons.restaurant,
                          'Food & Dining',
                          '₹ ${foodCost.toStringAsFixed(0)}',
                        ),
                        const SizedBox(height: 12),
                        _expenseRow(
                          Icons.hotel,
                          'Accommodation',
                          '₹ ${accommodationCost.toStringAsFixed(0)}',
                        ),
                        const SizedBox(height: 12),
                        _expenseRow(
                          Icons.medical_services,
                          'Emergency Fund',
                          '₹ ${emergencyCost.toStringAsFixed(0)}',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SafetyPrepPage7(
                              destination: '',
                              duration: '',
                              travellers: '',
                              travellerCount: 2,
                              userBudget: 2,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00796B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Safety & Preparation →',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _expenseRow(IconData icon, String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 16, color: const Color(0xFF00796B)),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
