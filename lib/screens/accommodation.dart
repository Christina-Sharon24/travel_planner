import 'package:flutter/material.dart';

class StaySuggestionsPage extends StatefulWidget {
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

  @override
  State<StaySuggestionsPage> createState() =>
      _StaySuggestionsPageState();
}

class _StaySuggestionsPageState
    extends State<StaySuggestionsPage> {
  int selectedStay = 0;

  List<Map<String, dynamic>> getStayOptions() {
    if (widget.destination == 'Paris, France') {
      return [
        {
          'name': 'Hotel du Louvre',
          'area': 'Central Paris',
          'price': 8500.0,
          'rating': 4.5,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Paris Budget Inn',
          'area': 'Montmartre',
          'price': 5200.0,
          'rating': 4.1,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'Le Meurice',
          'area': '1st Arrondissement',
          'price': 18500.0,
          'rating': 4.8,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    if (widget.destination == 'Dubai, UAE') {
      return [
        {
          'name': 'Dubai Marina Hotel',
          'area': 'Dubai Marina',
          'price': 6500.0,
          'rating': 4.4,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Dubai Budget Stay',
          'area': 'Deira',
          'price': 3800.0,
          'rating': 4.0,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'Burj View Resort',
          'area': 'Downtown Dubai',
          'price': 14500.0,
          'rating': 4.8,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    if (widget.destination == 'Singapore') {
      return [
        {
          'name': 'Orchard City Hotel',
          'area': 'Orchard Road',
          'price': 7200.0,
          'rating': 4.4,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Singapore Budget Stay',
          'area': 'Little India',
          'price': 4200.0,
          'rating': 4.0,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'Marina Bay Hotel',
          'area': 'Marina Bay',
          'price': 16000.0,
          'rating': 4.8,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    if (widget.destination == 'London, UK') {
      return [
        {
          'name': 'London Central Hotel',
          'area': 'Westminster',
          'price': 9000.0,
          'rating': 4.4,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'London Budget Rooms',
          'area': 'Paddington',
          'price': 5800.0,
          'rating': 4.0,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'The Royal London',
          'area': 'Mayfair',
          'price': 17500.0,
          'rating': 4.8,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    if (widget.destination == 'Tokyo, Japan') {
      return [
        {
          'name': 'Tokyo Central Hotel',
          'area': 'Shinjuku',
          'price': 7000.0,
          'rating': 4.5,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Tokyo Budget Stay',
          'area': 'Asakusa',
          'price': 4500.0,
          'rating': 4.1,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'Tokyo Grand Hotel',
          'area': 'Ginza',
          'price': 15500.0,
          'rating': 4.8,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    if (widget.destination == 'Bangkok, Thailand') {
      return [
        {
          'name': 'Bangkok City Hotel',
          'area': 'Sukhumvit',
          'price': 4800.0,
          'rating': 4.4,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Bangkok Budget Inn',
          'area': 'Old Town',
          'price': 2800.0,
          'rating': 4.0,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'Bangkok Riverside',
          'area': 'Riverside',
          'price': 9500.0,
          'rating': 4.7,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    if (widget.destination == 'Rome, Italy') {
      return [
        {
          'name': 'Rome Central Hotel',
          'area': 'Historic Centre',
          'price': 7800.0,
          'rating': 4.4,
          'type': 'Moderate',
          'icon': Icons.hotel_outlined,
        },
        {
          'name': 'Rome Budget Stay',
          'area': 'Termini',
          'price': 5000.0,
          'rating': 4.0,
          'type': 'Budget',
          'icon': Icons.bed_outlined,
        },
        {
          'name': 'Roman Luxury Hotel',
          'area': 'Spanish Steps',
          'price': 16000.0,
          'rating': 4.8,
          'type': 'Premium',
          'icon': Icons.apartment_outlined,
        },
      ];
    }

    return [
      {
        'name': 'New York Central Hotel',
        'area': 'Manhattan',
        'price': 10000.0,
        'rating': 4.4,
        'type': 'Moderate',
        'icon': Icons.hotel_outlined,
      },
      {
        'name': 'New York Budget Stay',
        'area': 'Brooklyn',
        'price': 6500.0,
        'rating': 4.0,
        'type': 'Budget',
        'icon': Icons.bed_outlined,
      },
      {
        'name': 'Manhattan Grand Hotel',
        'area': 'Midtown',
        'price': 19000.0,
        'rating': 4.8,
        'type': 'Premium',
        'icon': Icons.apartment_outlined,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final stays = getStayOptions();

    final selectedPrice =
    stays[selectedStay]['price'] as double;

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
              const Text(
                'Find Your Stay',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              Text(
                'Choose a comfortable stay in ${widget.destination}.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 20),

              // TRIP INFO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(
                    color: const Color(0xFFD9E2E7),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xFF155E75),
                      size: 20,
                    ),

                    const SizedBox(width: 9),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your trip',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${widget.duration} • ${widget.travellerCount} traveller${widget.travellerCount == 1 ? '' : 's'}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF183B4E),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.hotel_outlined,
                      color: Color(0xFF155E75),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              const Text(
                'Recommended Stays',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Select an option that matches your comfort and budget.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 13),

              ...List.generate(
                stays.length,
                    (index) {
                  final stay = stays[index];
                  final bool selected =
                      selectedStay == index;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: _stayCard(
                      stay: stay,
                      selected: selected,
                      onTap: () {
                        setState(() {
                          selectedStay = index;
                        });
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 5),

              // SELECTED STAY
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF155E75),
                      size: 21,
                    ),

                    const SizedBox(width: 9),

                    Expanded(
                      child: Text(
                        '${stays[selectedStay]['name']} selected',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                    ),

                    Text(
                      '₹${selectedPrice.toStringAsFixed(0)}/night',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF155E75),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // DONE
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedPrice=
                    stays[selectedStay]['price'] as double;
                    Navigator.pop(context,selectedPrice);
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
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.check_rounded,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stayCard({
    required Map<String, dynamic> stay,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: selected
                ? const Color(0xFF155E75)
                : const Color(0xFFD9E2E7),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4F1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                stay['icon'],
                color: const Color(0xFF155E75),
                size: 24,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    stay['name'],
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
                        size: 13,
                        color: Color(0xFF64748B),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          stay['area'],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${stay['rating']}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F6),
                          borderRadius:
                          BorderRadius.circular(5),
                        ),
                        child: Text(
                          stay['type'],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹${(stay['price'] as double).toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF155E75),
                  ),
                ),

                const SizedBox(height: 3),

                const Text(
                  'per night',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF64748B),
                  ),
                ),

                const SizedBox(height: 7),

                Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  size: 20,
                  color: selected
                      ? const Color(0xFF155E75)
                      : const Color(0xFF94A3B8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}