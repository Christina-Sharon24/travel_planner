import 'package:flutter/material.dart';

import 'accommodation.dart';

class GettingAroundPage extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const GettingAroundPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<GettingAroundPage> createState() => _GettingAroundPage5State();
}

class _GettingAroundPage5State extends State<GettingAroundPage> {
  // SafeTrail theme colours
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color cardColor = Color(0xFFFFFDFC);
  static const Color mainText = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color borderColor = Color(0xFFE7DFD8);

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
      selectedAirport = airportOptions[0]['name'] as String;
    }

    if (selectedCityTransport.isEmpty) {
      selectedCityTransport = cityOptions[0]['name'] as String;
    }

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: cardColor,
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
                  color: mainText,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Choose how you would like to travel during your trip.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: secondaryText,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Airport to Stay',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: mainText,
                ),
              ),
              const SizedBox(height: 10),

              ...airportOptions.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _transportCard(
                    name: option['name'] as String,
                    description: option['description'] as String,
                    price: option['price'] as String,
                    icon: option['icon'] as IconData,
                    selected: selectedAirport == option['name'],
                    onTap: () {
                      setState(() {
                        selectedAirport = option['name'] as String;
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
                  color: mainText,
                ),
              ),
              const SizedBox(height: 10),

              ...cityOptions.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _transportCard(
                    name: option['name'] as String,
                    description: option['description'] as String,
                    price: option['price'] as String,
                    icon: option['icon'] as IconData,
                    selected: selectedCityTransport == option['name'],
                    onTap: () {
                      setState(() {
                        selectedCityTransport = option['name'] as String;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: highlight.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, size: 20, color: primary),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Public transport is usually a good option for '
                        'exploring major tourist areas.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: secondaryText,
                          height: 1.4,
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
                        builder: (context) => StaySuggestionsPage(
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
                    backgroundColor: primary,
                    foregroundColor: cardColor,
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
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? primary : borderColor,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: selected ? highlight.withOpacity(0.55) : background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: primary, size: 21),
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
                      color: mainText,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: secondaryText,
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
                    fontWeight: FontWeight.w600,
                    color: mainText,
                  ),
                ),
                const SizedBox(height: 5),
                Icon(
                  selected ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: 19,
                  color: selected ? accent : secondaryText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
