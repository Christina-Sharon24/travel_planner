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
  State<StaySuggestionsPage> createState() => _StaySuggestionsPageState();
}

class _StaySuggestionsPageState extends State<StaySuggestionsPage> {
  // SafeTrail theme — matching TripPlanPage
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color card = Color(0xFFFFFDFC);
  static const Color text = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color border = Color(0xFFE7DFD8);

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

    final selectedPrice = stays[selectedStay]['price'] as double;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Accommodation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: text,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find Your Stay',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: primary,
                ),
              ),

              const SizedBox(height: 7),

              Text(
                'Choose a comfortable stay in ${widget.destination}.',
                style: const TextStyle(
                  fontSize: 14,
                  color: secondaryText,
                  height: 1.45,
                ),
              ),

              const SizedBox(height: 22),

              // TRIP INFO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: border),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: const Icon(
                        Icons.calendar_month_outlined,
                        color: primary,
                        size: 21,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your trip',
                            style: TextStyle(
                              fontSize: 12,
                              color: secondaryText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${widget.duration} • '
                            '${widget.travellerCount} traveller'
                            '${widget.travellerCount == 1 ? '' : 's'}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: text,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(Icons.hotel_outlined, color: accent, size: 24),
                  ],
                ),
              ),

              const SizedBox(height: 27),

              const Text(
                'Recommended Stays',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: text,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Select an option that matches your comfort and budget.',
                style: TextStyle(
                  fontSize: 13,
                  color: secondaryText,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 15),

              ...List.generate(stays.length, (index) {
                final stay = stays[index];
                final bool selected = selectedStay == index;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
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
              }),

              const SizedBox(height: 5),

              // SELECTED STAY
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: highlight.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: highlight.withOpacity(0.8)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: primary,
                      size: 22,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        '${stays[selectedStay]['name']} selected',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: text,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      '₹${selectedPrice.toStringAsFixed(0)}/night',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // DONE
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedPrice =
                        stays[selectedStay]['price'] as double;

                    Navigator.pop(context, selectedPrice);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 9),
                      Icon(Icons.check_rounded, size: 20),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
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
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? primary : border,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.09),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(stay['icon'] as IconData, color: primary, size: 24),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stay['name'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: text,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: accent,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          stay['area'] as String,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),

                  Wrap(
                    spacing: 7,
                    runSpacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.star_rounded, size: 15, color: accent),
                      Text(
                        '${stay['rating']}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: secondaryText,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: border),
                        ),
                        child: Text(
                          stay['type'] as String,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: secondaryText,
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
                    fontWeight: FontWeight.w700,
                    color: primary,
                  ),
                ),

                const SizedBox(height: 3),

                const Text(
                  'per night',
                  style: TextStyle(fontSize: 10, color: secondaryText),
                ),

                const SizedBox(height: 8),

                Icon(
                  selected
                      ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_unchecked_rounded,
                  size: 20,
                  color: selected ? primary : secondaryText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
