import 'package:flutter/material.dart';

import 'accomodation.dart';

class GettingAroundPage5 extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const GettingAroundPage5({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<GettingAroundPage5> createState() => _GettingAroundPage5State();
}

class _GettingAroundPage5State extends State<GettingAroundPage5> {
  String selectedAirport = '';
  String selectedCityTransport = '';

  List<Map<String, dynamic>> getTransportData() {
    if (widget.destination == 'Paris, France') {
      return [
        {
          'airport': [
            {
              'name': 'RER B Train',
              'description': 'Fast and budget friendly',
              'price': '₹450',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Taxi',
              'description': 'Direct and convenient',
              'price': '₹4,000',
              'icon': Icons.local_taxi_outlined,
            },
          ],
          'city': [
            {
              'name': 'Metro Pass',
              'description': 'Convenient for most attractions',
              'price': '₹1,500',
              'icon': Icons.directions_subway_outlined,
            },
            {
              'name': 'Bus',
              'description': 'Comfortable and affordable',
              'price': '₹900',
              'icon': Icons.directions_bus_outlined,
            },
          ],
        },
      ];
    }

    if (widget.destination == 'Dubai, UAE') {
      return [
        {
          'airport': [
            {
              'name': 'Dubai Metro',
              'description': 'Affordable and well connected',
              'price': '₹250',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Taxi',
              'description': 'Direct and convenient',
              'price': '₹1,800',
              'icon': Icons.local_taxi_outlined,
            },
          ],
          'city': [
            {
              'name': 'Metro + Bus',
              'description': 'Useful across major areas',
              'price': '₹1,200',
              'icon': Icons.directions_subway_outlined,
            },
            {
              'name': 'Taxi',
              'description': 'Easy for short distances',
              'price': '₹2,500',
              'icon': Icons.local_taxi_outlined,
            },
          ],
        },
      ];
    }

    if (widget.destination == 'Singapore') {
      return [
        {
          'airport': [
            {
              'name': 'MRT',
              'description': 'Fast and affordable',
              'price': '₹180',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Taxi',
              'description': 'Direct to your stay',
              'price': '₹1,800',
              'icon': Icons.local_taxi_outlined,
            },
          ],
          'city': [
            {
              'name': 'MRT Pass',
              'description': 'Best for sightseeing',
              'price': '₹1,300',
              'icon': Icons.directions_subway_outlined,
            },
            {
              'name': 'Public Bus',
              'description': 'Wide city coverage',
              'price': '₹800',
              'icon': Icons.directions_bus_outlined,
            },
          ],
        },
      ];
    }

    if (widget.destination == 'London, UK') {
      return [
        {
          'airport': [
            {
              'name': 'Heathrow Express',
              'description': 'Fast connection to central London',
              'price': '₹2,800',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Taxi',
              'description': 'Direct and convenient',
              'price': '₹7,000',
              'icon': Icons.local_taxi_outlined,
            },
          ],
          'city': [
            {
              'name': 'London Underground',
              'description': 'Best for major attractions',
              'price': '₹2,000',
              'icon': Icons.directions_subway_outlined,
            },
            {
              'name': 'City Bus',
              'description': 'Affordable and scenic',
              'price': '₹1,200',
              'icon': Icons.directions_bus_outlined,
            },
          ],
        },
      ];
    }

    if (widget.destination == 'Tokyo, Japan') {
      return [
        {
          'airport': [
            {
              'name': 'Airport Train',
              'description': 'Fast and reliable',
              'price': '₹1,500',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Bus',
              'description': 'Comfortable and convenient',
              'price': '₹1,200',
              'icon': Icons.directions_bus_outlined,
            },
          ],
          'city': [
            {
              'name': 'Metro Pass',
              'description': 'Easy access to attractions',
              'price': '₹1,600',
              'icon': Icons.directions_subway_outlined,
            },
            {
              'name': 'City Bus',
              'description': 'Useful for selected areas',
              'price': '₹900',
              'icon': Icons.directions_bus_outlined,
            },
          ],
        },
      ];
    }

    if (widget.destination == 'Bangkok, Thailand') {
      return [
        {
          'airport': [
            {
              'name': 'Airport Rail Link',
              'description': 'Fast and affordable',
              'price': '₹180',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Taxi',
              'description': 'Direct and convenient',
              'price': '₹900',
              'icon': Icons.local_taxi_outlined,
            },
          ],
          'city': [
            {
              'name': 'BTS Skytrain',
              'description': 'Useful for central areas',
              'price': '₹900',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Bus',
              'description': 'Low-cost option',
              'price': '₹500',
              'icon': Icons.directions_bus_outlined,
            },
          ],
        },
      ];
    }

    if (widget.destination == 'Rome, Italy') {
      return [
        {
          'airport': [
            {
              'name': 'Leonardo Express',
              'description': 'Direct airport train',
              'price': '₹1,600',
              'icon': Icons.train_outlined,
            },
            {
              'name': 'Airport Taxi',
              'description': 'Direct to central Rome',
              'price': '₹4,500',
              'icon': Icons.local_taxi_outlined,
            },
          ],
          'city': [
            {
              'name': 'Metro Pass',
              'description': 'Good for major attractions',
              'price': '₹1,200',
              'icon': Icons.directions_subway_outlined,
            },
            {
              'name': 'City Bus',
              'description': 'Budget-friendly option',
              'price': '₹800',
              'icon': Icons.directions_bus_outlined,
            },
          ],
        },
      ];
    }

    return [
      {
        'airport': [
          {
            'name': 'Airport Bus',
            'description': 'Affordable public transport',
            'price': '₹700',
            'icon': Icons.directions_bus_outlined,
          },
          {
            'name': 'Airport Taxi',
            'description': 'Direct and convenient',
            'price': '₹1,500',
            'icon': Icons.local_taxi_outlined,
          },
        ],
        'city': [
          {
            'name': 'Metro',
            'description': 'Convenient for city travel',
            'price': '₹1,000',
            'icon': Icons.directions_subway_outlined,
          },
          {
            'name': 'Bus',
            'description': 'Budget-friendly option',
            'price': '₹700',
            'icon': Icons.directions_bus_outlined,
          },
        ],
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final data = getTransportData().first;

    final airportOptions = data['airport'] as List<Map<String, dynamic>>;

    final cityOptions = data['city'] as List<Map<String, dynamic>>;

    if (selectedAirport.isEmpty) {
      selectedAirport = airportOptions[0]['name'];
    }

    if (selectedCityTransport.isEmpty) {
      selectedCityTransport = cityOptions[0]['name'];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Getting Around',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Getting around ${widget.destination}',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Choose how you would like to travel during your trip.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Airport to Stay',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              ...airportOptions.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _transportCard(
                    name: option['name'],
                    description: option['description'],
                    price: option['price'],
                    icon: option['icon'],
                    selected: selectedAirport == option['name'],
                    onTap: () {
                      setState(() {
                        selectedAirport = option['name'];
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'Around the City',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              ...cityOptions.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _transportCard(
                    name: option['name'],
                    description: option['description'],
                    price: option['price'],
                    icon: option['icon'],
                    selected: selectedCityTransport == option['name'],
                    onTap: () {
                      setState(() {
                        selectedCityTransport = option['name'];
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 12),

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
                      Icons.info_outline,
                      size: 20,
                      color: Color(0xFF155E75),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Public transport is usually a good option for exploring major tourist areas.',
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

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaySuggestionsPage6(
                          destination: widget.destination,
                          duration: widget.duration,
                          travellers: widget.travellers,
                          travellerCount: widget.travellerCount,
                          userBudget: widget.userBudget,
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
                        'Choose Stay',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(Icons.arrow_forward_rounded, size: 19),
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

  Widget _transportCard({
    required String name,
    required String description,
    required String price,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF155E75) : const Color(0xFFD9E2E7),
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFFE6F4F1)
                    : const Color(0xFFF8FAF9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF155E75), size: 21),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF183B4E),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF183B4E),
                  ),
                ),
                const SizedBox(height: 5),
                Icon(
                  selected ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: 19,
                  color: selected
                      ? const Color(0xFF2A9D8F)
                      : const Color(0xFFB8C4CA),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
