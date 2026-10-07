import 'package:flutter/material.dart';
import 'package:travel_planner/screens/safety_prep_page.dart';

class TripResultPage7 extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final double userBudget;
  final int travellerCount;

  const TripResultPage7({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.userBudget,
    required this.travellerCount,
  });

  @override
  Widget build(BuildContext context) {
    final double transportCost = userBudget * 0.35;
    final double foodCost = userBudget * 0.20;
    final double accommodationCost = userBudget * 0.30;
    final double emergencyCost = userBudget * 0.15;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Trip Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Trip Plan',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Here is a quick overview of the trip you planned.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFD9E2E7),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F4F1),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF155E75),
                            size: 23,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Destination',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                destination,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF183B4E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    const Divider(
                      color: Color(0xFFE6ECEF),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: _tripDetail(
                            Icons.calendar_month_outlined,
                            'Duration',
                            duration,
                          ),
                        ),
                        Expanded(
                          child: _tripDetail(
                            Icons.people_outline,
                            'Travellers',
                            '$travellerCount',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Estimated Budget',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFD9E2E7),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Trip Budget',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        Text(
                          '₹${userBudget.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF155E75),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    const Divider(
                      color: Color(0xFFE6ECEF),
                    ),

                    const SizedBox(height: 14),

                    _expenseRow(
                      Icons.directions_bus_outlined,
                      'Transport',
                      transportCost,
                    ),

                    const SizedBox(height: 13),

                    _expenseRow(
                      Icons.restaurant_outlined,
                      'Food & Dining',
                      foodCost,
                    ),

                    const SizedBox(height: 13),

                    _expenseRow(
                      Icons.hotel_outlined,
                      'Accommodation',
                      accommodationCost,
                    ),

                    const SizedBox(height: 13),

                    _expenseRow(
                      Icons.shield_outlined,
                      'Emergency Fund',
                      emergencyCost,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 20,
                      color: Color(0xFF155E75),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your trip plan is ready for $destination. Next, prepare for a safer and smoother journey.',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SafetyPrepPage(
                          destination: destination,
                          duration: duration,
                          travellers: travellers,
                          travellerCount: travellerCount,
                          userBudget: userBudget,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF155E75),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Safety & Preparation',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 19,
                      ),
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

  Widget _tripDetail(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: const Color(0xFF155E75),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF183B4E),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _expenseRow(
      IconData icon,
      String title,
      double amount,
      ) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F4F1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF155E75),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF183B4E),
            ),
          ),
        ),

        Text(
          '₹${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF183B4E),
          ),
        ),
      ],
    );
  }
}