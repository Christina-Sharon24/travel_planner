import 'package:flutter/material.dart';
import 'trip_result.dart';

class StaySuggestionsPage extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const StaySuggestionsPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  List<Map<String, dynamic>> getStayOptions() {
    if (destination == 'Paris, France') {
      return [
        {
          'name': 'Hotel du Centre',
          'area': 'Near central Paris',
          'type': 'Budget',
          'price': '₹5,500 / night',
          'rating': '4.1',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Paris City Stay',
          'area': 'Near Louvre',
          'type': 'Moderate',
          'price': '₹9,000 / night',
          'rating': '4.4',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Le Grand Paris',
          'area': 'Central Paris',
          'type': 'Premium',
          'price': '₹18,000 / night',
          'rating': '4.7',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    if (destination == 'Dubai, UAE') {
      return [
        {
          'name': 'Dubai Budget Inn',
          'area': 'Deira',
          'type': 'Budget',
          'price': '₹4,500 / night',
          'rating': '4.0',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'City View Dubai',
          'area': 'Bur Dubai',
          'type': 'Moderate',
          'price': '₹8,500 / night',
          'rating': '4.4',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Marina Grand Hotel',
          'area': 'Dubai Marina',
          'type': 'Premium',
          'price': '₹17,500 / night',
          'rating': '4.7',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    if (destination == 'Singapore') {
      return [
        {
          'name': 'Singapore Budget Stay',
          'area': 'Little India',
          'type': 'Budget',
          'price': '₹5,000 / night',
          'rating': '4.0',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'City Square Hotel',
          'area': 'Bugis',
          'type': 'Moderate',
          'price': '₹9,500 / night',
          'rating': '4.4',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Marina Bay Stay',
          'area': 'Marina Bay',
          'type': 'Premium',
          'price': '₹20,000 / night',
          'rating': '4.8',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    if (destination == 'London, UK') {
      return [
        {
          'name': 'London Budget Rooms',
          'area': "Kings' Cross",
        'type': 'Budget',
          'price': '₹7,000 / night',
          'rating': '4.0',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Central London Stay',
          'area': 'Westminster',
          'type': 'Moderate',
          'price': '₹12,000 / night',
          'rating': '4.4',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Royal London Hotel',
          'area': 'Central London',
          'type': 'Premium',
          'price': '₹23,000 / night',
          'rating': '4.7',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    if (destination == 'Tokyo, Japan') {
      return [
        {
          'name': 'Tokyo Smart Stay',
          'area': 'Asakusa',
          'type': 'Budget',
          'price': '₹5,500 / night',
          'rating': '4.1',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Tokyo City Hotel',
          'area': 'Shinjuku',
          'type': 'Moderate',
          'price': '₹10,000 / night',
          'rating': '4.5',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Tokyo Grand Stay',
          'area': 'Ginza',
          'type': 'Premium',
          'price': '₹21,000 / night',
          'rating': '4.8',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    if (destination == 'Bangkok, Thailand') {
      return [
        {
          'name': 'Bangkok Budget Rooms',
          'area': 'Old Town',
          'type': 'Budget',
          'price': '₹2,500 / night',
          'rating': '4.0',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Bangkok City Hotel',
          'area': 'Sukhumvit',
          'type': 'Moderate',
          'price': '₹5,500 / night',
          'rating': '4.4',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Riverside Bangkok',
          'area': 'Chao Phraya',
          'type': 'Premium',
          'price': '₹12,000 / night',
          'rating': '4.7',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    if (destination == 'Rome, Italy') {
      return [
        {
          'name': 'Rome Budget Stay',
          'area': 'Near Termini',
          'type': 'Budget',
          'price': '₹5,000 / night',
          'rating': '4.0',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Roma City Hotel',
          'area': 'Near Colosseum',
          'type': 'Moderate',
          'price': '₹9,000 / night',
          'rating': '4.4',
          'icon': Icons.apartment_outlined,
        },
        {
          'name': 'Roman Grand Hotel',
          'area': 'Central Rome',
          'type': 'Premium',
          'price': '₹17,000 / night',
          'rating': '4.7',
          'icon': Icons.domain_outlined,
        },
      ];
    }

    return [
      {
        'name': 'City Budget Stay',
        'area': 'Near city centre',
        'type': 'Budget',
        'price': '₹4,000 / night',
        'rating': '4.0',
        'icon': Icons.hotel_outlined,
      },
      {
        'name': 'City Comfort Hotel',
        'area': 'Central area',
        'type': 'Moderate',
        'price': '₹7,500 / night',
        'rating': '4.3',
        'icon': Icons.apartment_outlined,
      },
      {
        'name': 'Grand City Hotel',
        'area': 'City centre',
        'type': 'Premium',
        'price': '₹14,000 / night',
        'rating': '4.6',
        'icon': Icons.domain_outlined,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final stays = getStayOptions();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Accommodation',
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
              Text(
                'Where will you stay in $destination?',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Choose a stay that fits your trip and budget.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1E7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 20,
                      color: Color(0xFFF4A261),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your total trip budget is ₹${userBudget.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              const Text(
                'Recommended stays',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              ...stays.map(
                    (stay) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _stayCard(
                    name: stay['name'],
                    area: stay['area'],
                    type: stay['type'],
                    price: stay['price'],
                    rating: stay['rating'],
                    icon: stay['icon'],
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 20,
                      color: Color(0xFF155E75),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'For a lower-cost trip, consider staying slightly outside the city centre with easy public transport access.',
                        style: TextStyle(
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
                        builder: (context) => TripResultPage7(
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
                        'View Trip Summary',
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

  Widget _stayCard({
    required String name,
    required String area,
    required String type,
    required String price,
    required String rating,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFD9E2E7),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4F1),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              size: 23,
              color: const Color(0xFF155E75),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF183B4E),
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        area,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAF9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Icon(
                      Icons.star,
                      size: 14,
                      color: Color(0xFFF4A261),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF183B4E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            price,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF155E75),
            ),
          ),
        ],
      ),
    );
  }
}