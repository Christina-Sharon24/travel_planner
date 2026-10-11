import 'package:flutter/material.dart';
import 'package:travel_planner/screens/addexpense.dart';
import 'package:travel_planner/screens/sos_page.dart';
import 'package:travel_planner/screens/trip_wallet.dart';

class TripModePage extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final double userBudget;
  final List<Map<String, dynamic>> expenses;

  const TripModePage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.userBudget,
    this.expenses = const [],
  });

  // SafeTrail theme
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color cardColor = Color(0xFFFFFDFC);
  static const Color mainText = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color borderColor = Color(0xFFE7DFD8);

  String getDestinationImage() {
    if (destination == 'Paris, France') {
      return 'assets/images/paris.jpg';
    }

    if (destination == 'Dubai, UAE') {
      return 'assets/images/dubai.jpg';
    }

    if (destination == 'Singapore') {
      return 'assets/images/singapore.jpg';
    }

    if (destination == 'London, UK') {
      return 'assets/images/london.jpg';
    }

    if (destination == 'Tokyo, Japan') {
      return 'assets/images/tokyo.jpg';
    }

    if (destination == 'Bangkok, Thailand') {
      return 'assets/images/bangkok.jpg';
    }

    if (destination == 'Rome, Italy') {
      return 'assets/images/rome.jpg';
    }

    return 'assets/images/default.jpg';
  }

  String getEmergencyNumber() {
    if (destination == 'Paris, France') {
      return '112';
    }

    if (destination == 'Dubai, UAE') {
      return '999';
    }

    if (destination == 'Singapore') {
      return '999';
    }

    if (destination == 'London, UK') {
      return '999 / 112';
    }

    if (destination == 'Tokyo, Japan') {
      return '110 / 119';
    }

    if (destination == 'Bangkok, Thailand') {
      return '191';
    }

    if (destination == 'Rome, Italy') {
      return '112';
    }

    return 'Check local emergency number';
  }

  double getTotalSpent() {
    return expenses.fold<double>(0.0, (total, expense) {
      final amount = expense['amount'];

      if (amount is num) {
        return total + amount.toDouble();
      }

      return total + (double.tryParse(amount?.toString() ?? '') ?? 0.0);
    });
  }

  List<Map<String, dynamic>> getItinerary() {
    if (destination == 'Paris, France') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Eiffel Tower',
          'price': '₹2,000',
          'icon': Icons.photo_camera,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Local food',
          'price': '₹300',
          'icon': Icons.restaurant,
        },
        {
          'time': '02:00 PM',
          'title': 'Louvre Museum',
          'price': '₹1,500',
          'icon': Icons.museum,
        },
        {
          'time': '06:30 PM',
          'title': 'Evening city walk',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    if (destination == 'Dubai, UAE') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Dubai Marina',
          'price': '₹1,000',
          'icon': Icons.location_city,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Local food',
          'price': '₹500',
          'icon': Icons.restaurant,
        },
        {
          'time': '03:00 PM',
          'title': 'Burj Khalifa',
          'price': '₹3,000',
          'icon': Icons.apartment,
        },
        {
          'time': '07:00 PM',
          'title': 'Dubai Mall walk',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    if (destination == 'Singapore') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Gardens by the Bay',
          'price': '₹1,200',
          'icon': Icons.park,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Local food',
          'price': '₹500',
          'icon': Icons.restaurant,
        },
        {
          'time': '03:00 PM',
          'title': 'Marina Bay',
          'price': '₹800',
          'icon': Icons.location_city,
        },
        {
          'time': '06:30 PM',
          'title': 'Evening city walk',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    if (destination == 'London, UK') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Tower Bridge',
          'price': '₹1,500',
          'icon': Icons.account_balance,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Local food',
          'price': '₹600',
          'icon': Icons.restaurant,
        },
        {
          'time': '03:00 PM',
          'title': 'British Museum',
          'price': 'Free',
          'icon': Icons.museum,
        },
        {
          'time': '06:30 PM',
          'title': 'Thames evening walk',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    if (destination == 'Tokyo, Japan') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Senso-ji Temple',
          'price': 'Free',
          'icon': Icons.temple_buddhist,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Japanese food',
          'price': '₹700',
          'icon': Icons.restaurant,
        },
        {
          'time': '03:00 PM',
          'title': 'Shibuya Crossing',
          'price': 'Free',
          'icon': Icons.location_city,
        },
        {
          'time': '06:30 PM',
          'title': 'Tokyo evening walk',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    if (destination == 'Bangkok, Thailand') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Grand Palace',
          'price': '₹1,000',
          'icon': Icons.account_balance,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Thai food',
          'price': '₹400',
          'icon': Icons.restaurant,
        },
        {
          'time': '03:00 PM',
          'title': 'Wat Arun',
          'price': '₹500',
          'icon': Icons.temple_buddhist,
        },
        {
          'time': '06:30 PM',
          'title': 'Evening market',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    if (destination == 'Rome, Italy') {
      return [
        {
          'time': '09:00 AM',
          'title': 'Colosseum',
          'price': '₹1,500',
          'icon': Icons.account_balance,
        },
        {
          'time': '12:30 PM',
          'title': 'Lunch - Italian food',
          'price': '₹600',
          'icon': Icons.restaurant,
        },
        {
          'time': '03:00 PM',
          'title': 'Trevi Fountain',
          'price': 'Free',
          'icon': Icons.water,
        },
        {
          'time': '06:30 PM',
          'title': 'Evening city walk',
          'price': 'Free',
          'icon': Icons.directions_walk,
        },
      ];
    }

    return [
      {
        'time': '09:00 AM',
        'title': 'Explore local attractions',
        'price': 'Varies',
        'icon': Icons.explore,
      },
      {
        'time': '12:30 PM',
        'title': 'Lunch - Local food',
        'price': 'Varies',
        'icon': Icons.restaurant,
      },
      {
        'time': '03:00 PM',
        'title': 'Visit a popular attraction',
        'price': 'Varies',
        'icon': Icons.place,
      },
      {
        'time': '06:30 PM',
        'title': 'Evening exploration',
        'price': 'Free',
        'icon': Icons.directions_walk,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final itinerary = getItinerary();
    final double spent = getTotalSpent();
    final double remaining = userBudget - spent;
    final double progress = userBudget > 0
        ? (spent / userBudget).clamp(0.0, 1.0)
        : 0.0;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: primary,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TRIP MODE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$destination • $duration',
                          style: const TextStyle(
                            color: Color(0xFFE8D5D5),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SosPage(
                            destination: destination,
                            emergencyNumber: getEmergencyNumber(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'SOS',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),

            // CONTENT
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(18),
                children: [
                  // DESTINATION IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      getDestinationImage(),
                      width: double.infinity,
                      height: 190,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 190,
                          color: highlight,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.landscape_outlined,
                            size: 55,
                            color: primary,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    destination,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: mainText,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '$duration • $travellers',
                    style: const TextStyle(fontSize: 13, color: secondaryText),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "TODAY'S ITINERARY",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: primary,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  for (final item in itinerary)
                    _buildItineraryCard(
                      item['time'] as String,
                      item['title'] as String,
                      item['price'] as String,
                      item['icon'] as IconData,
                    ),

                  const SizedBox(height: 12),

                  // BUDGET SUMMARY
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TripWalletPage(
                            destination: destination,
                            duration: duration,
                            userBudget: userBudget,
                            expenses: expenses,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'TRIP SPENDING',
                                  style: TextStyle(
                                    color: Color(0xFFE8D5D5),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  '₹${spent.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'of ₹${userBudget.toStringAsFixed(0)} budget',
                                  style: const TextStyle(
                                    color: Color(0xFFE8D5D5),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    backgroundColor: const Color(0xFF895D66),
                                    color: highlight,
                                    minHeight: 6,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  remaining >= 0
                                      ? '₹${remaining.toStringAsFixed(0)} remaining'
                                      : '₹${remaining.abs().toStringAsFixed(0)} over budget',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(13),
                            decoration: const BoxDecoration(
                              color: Color(0xFF895D66),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Colors.white,
                              size: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ADD EXPENSE
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
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
                        foregroundColor: primary,
                        side: const BorderSide(color: primary, width: 1.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItineraryCard(
    String time,
    String title,
    String price,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 68,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: secondaryText,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF1DFDA),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: primary, size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: mainText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
