import 'package:flutter/material.dart';
import 'package:travel_planner/screens/food.dart';
import 'package:travel_planner/screens/trip_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripPlanPage extends StatefulWidget {
  const TripPlanPage({super.key});

  @override
  State<TripPlanPage> createState() => _TripPlanPageState();
}

class _TripPlanPageState extends State<TripPlanPage> {
  int travellers = 2;

  String selectedTravelType = 'Couple';
  String selectedDestination = 'Paris, France';

  DateTime? startDate;
  DateTime? endDate;

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

  Future<void> _selectStartDate() async {
    final DateTime today = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? today,
      firstDate: today,
      lastDate: DateTime(today.year + 2),
    );

    if (picked != null) {
      setState(() {
        startDate = picked;

        // If the previously selected end date is before the new start date,
        // clear it.
        if (endDate != null && endDate!.isBefore(picked)) {
          endDate = null;
        }
      });
    }
  }

  Future<void> _selectEndDate() async {
    if (startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your start date first.')),
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? startDate!.add(const Duration(days: 1)),
      firstDate: startDate!,
      lastDate: DateTime(startDate!.year + 2),
    );

    if (picked != null) {
      setState(() {
        endDate = picked;
      });
    }
  }

  int get tripDays {
    if (startDate == null || endDate == null) {
      return 0;
    }

    return endDate!.difference(startDate!).inDays + 1;
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Select date';
    }

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
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
                style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),

              const SizedBox(height: 22),

              // DESTINATION
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

              // TRAVEL DATES
              const Text(
                'When are you travelling?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _dateCard(
                      title: 'Start date',
                      date: startDate,
                      onTap: _selectStartDate,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _dateCard(
                      title: 'End date',
                      date: endDate,
                      onTap: _selectEndDate,
                    ),
                  ),
                ],
              ),

              if (tripDays > 0) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F3F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$tripDays ${tripDays == 1 ? 'day' : 'days'} trip',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF155E75),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 23),

              // TRAVELLER TYPE
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
                      final bool selected = selectedTravelType == type;

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

              // TRAVELLERS
              const Text(
                'Number of travellers',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
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

              // BUDGET
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
                style: const TextStyle(fontSize: 14, color: Color(0xFF183B4E)),
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

              const SizedBox(height: 25),

              // CONTINUE
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () async {
                    if (startDate == null || endDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select your travel dates.'),
                        ),
                      );
                      return;
                    }

                    final double budget =
                        double.tryParse(budgetController.text) ?? 0;

                    if (budget <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid budget.'),
                        ),
                      );
                      return;
                    }
                    await FirebaseFirestore.instance.collection('trips').add({
                      'destination': selectedDestination,
                      'travelType': selectedTravelType,
                      'travellers': travellers,
                      'budget': budget,
                      'startDate': Timestamp.fromDate(startDate!),
                      'endDate': Timestamp.fromDate(endDate!),
                      'tripDays': tripDays,
                      'createdAt': FieldValue.serverTimestamp(),
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripResultPage(
                          destination: selectedDestination,
                          duration: '$tripDays days',
                          travellers: '$travellers travellers',
                          travellerCount: travellers,
                          userBudget: budget,
                          startDate: startDate!,
                          endDate: endDate!,
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

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateCard({
    required String title,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD9E2E7)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              size: 20,
              color: Color(0xFF155E75),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    _formatDate(date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: date == null
                          ? const Color(0xFF64748B)
                          : const Color(0xFF183B4E),
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
              style: const TextStyle(fontSize: 14, color: Color(0xFF183B4E)),
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
