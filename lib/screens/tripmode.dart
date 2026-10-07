import 'package:flutter/material.dart';
import 'package:travel_planner/screens/addexpense.dart';
import 'package:travel_planner/screens/sos_page.dart';
import 'package:travel_planner/screens/trip_wallet.dart';

class TripModePage extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final double userBudget;

  const TripModePage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.userBudget,
  });

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

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: const Color(0xFF155E75),
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
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '$destination • $duration',
                          style: const TextStyle(
                            color: Colors.white70,
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
                      backgroundColor: const Color(0xFFE76F51),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'SOS',
                      style: TextStyle(fontWeight: FontWeight.w600),
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
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      getDestinationImage(),
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    destination,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF183B4E),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '$duration • $travellers',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 23),

                  const Text(
                    'TODAY\'S ITINERARY',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF155E75),
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 10),

                  for (final item in itinerary)
                    _buildItineraryCard(
                      item['time'],
                      item['title'],
                      item['price'],
                      item['icon'],
                    ),

                  const SizedBox(height: 10),

                  // BUDGET
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TripWalletPage(
                            destination: destination,
                            duration: duration,
                            userBudget: userBudget, newExpense: {},
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF155E75),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'TODAY\'S SPENDING',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '₹4,200',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'of ₹${userBudget.toStringAsFixed(0)} budget',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              '42%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
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
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddExpensePage(
                              destination: destination,
                              duration: duration,
                              userBudget: userBudget,
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF155E75)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        '+ Add Expense',
                        style: TextStyle(
                          color: Color(0xFF155E75),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFD9E2E7)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 65,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ),

          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4F1),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: const Color(0xFF155E75), size: 20),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xFF183B4E),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF2A9D8F),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
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
