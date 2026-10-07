import 'package:flutter/material.dart';
import 'package:travel_planner/screens/food.dart';

class TripPlanPage2 extends StatefulWidget {
  const TripPlanPage2({super.key});

  @override
  State<TripPlanPage2> createState() => _TripPlanPage2State();
}

class _TripPlanPage2State extends State<TripPlanPage2> {
  int days = 5;
  int travellers = 2;

  String selectedTravelType = 'Couple';
  String selectedDestination = 'Paris, France';

  final TextEditingController budgetController = TextEditingController(
    text: '50000',
  );

  final List<String> destinations = [
    'Paris, France',
    'Dubai, UAE',
    'Singapore',
    'London, UK',
    'Tokyo, Japan',
    'Bangkok, Thailand',
    'Rome, Italy',
    'New York, USA',
  ];

  @override
  void dispose() {
    budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Plan Your Trip',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Where are you travelling?',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Choose your destination and trip details.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Destination',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 8),

              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD9E2E7)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedDestination,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF155E75),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF183B4E),
                    ),
                    items: destinations.map((destination) {
                      return DropdownMenuItem<String>(
                        value: destination,
                        child: Text(destination),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedDestination = value;
                        });
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: 23),

              const Text(
                'Who are you travelling with?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 7,
                runSpacing: 7,
                children:
                    [
                      'Solo',
                      'Couple',
                      'Family',
                      'Friends',
                      'Group',
                      'Senior',
                    ].map((type) {
                      bool selected = selectedTravelType == type;

                      return ChoiceChip(
                        label: Text(
                          type,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: selected
                                ? FontWeight.w500
                                : FontWeight.w400,
                            color: selected
                                ? Colors.white
                                : const Color(0xFF183B4E),
                          ),
                        ),
                        selected: selected,
                        selectedColor: const Color(0xFF155E75),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFD9E2E7)),
                        onSelected: (value) {
                          if (value) {
                            setState(() {
                              selectedTravelType = type;
                            });
                          }
                        },
                      );
                    }).toList(),
              ),

              const SizedBox(height: 23),

              const Text(
                'Trip Duration',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              _counterCard(
                icon: Icons.calendar_month_outlined,
                title: 'Number of days',
                value: days,
                onMinus: () {
                  if (days > 1) {
                    setState(() {
                      days--;
                    });
                  }
                },
                onPlus: () {
                  setState(() {
                    days++;
                  });
                },
              ),

              const SizedBox(height: 10),

              _counterCard(
                icon: Icons.people_outline,
                title: 'Travellers',
                value: travellers,
                onMinus: () {
                  if (travellers > 1) {
                    setState(() {
                      travellers--;
                    });
                  }
                },
                onPlus: () {
                  setState(() {
                    travellers++;
                  });
                },
              ),

              const SizedBox(height: 23),

              const Text(
                'Total Budget',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 9),

              TextField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF183B4E),
                ),
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  prefixStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF155E75),
                  ),
                  prefixIcon: const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 19,
                    color: Color(0xFF155E75),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFD9E2E7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFD9E2E7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF155E75)),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    double budget = double.tryParse(budgetController.text) ?? 0;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodPreferencesPage3(
                          destination: selectedDestination,
                          duration: '$days days',
                          travellers: '$travellers travellers',
                          travellerCount: travellers,
                          userBudget: budget,
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
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _counterCard({
    required IconData icon,
    required String title,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD9E2E7)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF155E75)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF183B4E),
              ),
            ),
          ),
          IconButton(
            onPressed: onMinus,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            icon: const Icon(Icons.remove, size: 18, color: Color(0xFF155E75)),
          ),
          SizedBox(
            width: 25,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF183B4E),
              ),
            ),
          ),
          IconButton(
            onPressed: onPlus,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            icon: const Icon(Icons.add, size: 18, color: Color(0xFF155E75)),
          ),
        ],
      ),
    );
  }
}
