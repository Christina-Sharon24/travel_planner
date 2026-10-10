import 'package:flutter/material.dart';
import 'package:travel_planner/screens/trip_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripPlanPage extends StatefulWidget {
  const TripPlanPage({super.key});

  @override
  State<TripPlanPage> createState() => _TripPlanPageState();
}

class _TripPlanPageState extends State<TripPlanPage> {
  // SafeTrail theme
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color card = Color(0xFFFFFDFC);
  static const Color text = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color border = Color(0xFFE7DFD8);

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

  final List<String> travelTypes = [
    'Solo',
    'Couple',
    'Family',
    'Friends',
    'Group',
    'Senior',
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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primary,
              onPrimary: Colors.white,
              surface: card,
              onSurface: text,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        startDate = picked;

        if (endDate != null && endDate!.isBefore(picked)) {
          endDate = null;
        }
      });
    }
  }

  Future<void> _selectEndDate() async {
    if (startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your start date first.'),
          backgroundColor: primary,
        ),
      );
      return;
    }

    final DateTime minimumEndDate = startDate!.add(const Duration(days: 1));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? minimumEndDate,
      firstDate: startDate!,
      lastDate: DateTime(startDate!.year + 2),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primary,
              onPrimary: Colors.white,
              surface: card,
              onSurface: text,
            ),
          ),
          child: child!,
        );
      },
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

  Future<void> _continueToTrip() async {
    // Validate dates
    if (startDate == null || endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your travel dates.'),
          backgroundColor: primary,
        ),
      );
      return;
    }

    // Validate budget
    final double budget = double.tryParse(budgetController.text.trim()) ?? 0;

    if (budget <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid budget.'),
          backgroundColor: primary,
        ),
      );
      return;
    }

    // Show loading state
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator(color: primary));
      },
    );

    try {
      // Save trip to Firestore
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

      if (!mounted) return;

      // Close loading dialog
      Navigator.of(context).pop();

      // Open Your Trip
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
    } catch (e) {
      if (!mounted) return;

      // Close loading dialog
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not save your trip. Please try again.'),
          backgroundColor: primary,
          duration: const Duration(seconds: 4),
        ),
      );

      debugPrint('Trip save error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Plan Your Trip',
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
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.flight_takeoff_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Let’s plan your next adventure',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Tell us a few details and SafeTrail will prepare your trip plan.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.82),
                        fontSize: 13.5,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Destination
              _sectionLabel(
                icon: Icons.location_on_outlined,
                title: 'Where are you going?',
              ),

              const SizedBox(height: 11),

              Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: border),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedDestination,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: primary,
                    ),
                    dropdownColor: card,
                    style: const TextStyle(
                      fontSize: 15,
                      color: text,
                      fontWeight: FontWeight.w500,
                    ),
                    items: destinations.map((destination) {
                      return DropdownMenuItem<String>(
                        value: destination,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.place_outlined,
                              size: 19,
                              color: accent,
                            ),
                            const SizedBox(width: 10),
                            Text(destination),
                          ],
                        ),
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

              const SizedBox(height: 27),

              // Dates
              _sectionLabel(
                icon: Icons.calendar_month_outlined,
                title: 'When are you travelling?',
              ),

              const SizedBox(height: 11),

              Row(
                children: [
                  Expanded(
                    child: _dateCard(
                      title: 'Start date',
                      date: startDate,
                      onTap: _selectStartDate,
                    ),
                  ),
                  const SizedBox(width: 12),
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
                const SizedBox(height: 11),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: highlight.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule_rounded,
                        size: 18,
                        color: primary,
                      ),
                      const SizedBox(width: 9),
                      Text(
                        '$tripDays ${tripDays == 1 ? 'day' : 'days'} trip',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 27),

              // Travel type
              _sectionLabel(
                icon: Icons.groups_outlined,
                title: 'Who are you travelling with?',
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 9,
                runSpacing: 9,
                children: travelTypes.map((type) {
                  final bool selected = selectedTravelType == type;

                  return ChoiceChip(
                    label: Text(
                      type,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: selected ? Colors.white : text,
                      ),
                    ),
                    selected: selected,
                    selectedColor: primary,
                    backgroundColor: card,
                    side: BorderSide(color: selected ? primary : border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 3,
                    ),
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

              const SizedBox(height: 27),

              // Travellers
              _sectionLabel(
                icon: Icons.person_outline_rounded,
                title: 'Number of travellers',
              ),

              const SizedBox(height: 11),

              _counterCard(),

              const SizedBox(height: 27),

              // Budget
              _sectionLabel(
                icon: Icons.account_balance_wallet_outlined,
                title: 'What is your total budget?',
              ),

              const SizedBox(height: 11),

              TextField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 15,
                  color: text,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  prefixStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: primary,
                  ),
                  prefixIcon: const Icon(
                    Icons.currency_rupee_rounded,
                    size: 19,
                    color: primary,
                  ),
                  filled: true,
                  fillColor: card,
                  hintText: 'Enter your budget',
                  hintStyle: const TextStyle(
                    color: secondaryText,
                    fontSize: 14,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 17,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: primary, width: 1.5),
                  ),
                ),
              ),

              const SizedBox(height: 9),

              const Text(
                'This helps SafeTrail estimate your overall trip cost.',
                style: TextStyle(fontSize: 12, color: secondaryText),
              ),

              const SizedBox(height: 30),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _continueToTrip,
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
                        'Continue to Your Trip',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 9),
                      Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  'You can review and change your trip plan later.',
                  style: TextStyle(fontSize: 11.5, color: secondaryText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel({required IconData icon, required String title}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.10),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 19, color: primary),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w700,
            color: text,
          ),
        ),
      ],
    );
  }

  Widget _dateCard({
    required String title,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    final bool hasDate = date != null;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 78,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hasDate ? primary.withOpacity(0.35) : border,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: hasDate ? primary.withOpacity(0.10) : background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.calendar_today_rounded,
                size: 18,
                color: hasDate ? primary : secondaryText,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 11, color: secondaryText),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: hasDate ? FontWeight.w600 : FontWeight.w400,
                      color: hasDate ? text : secondaryText,
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

  Widget _counterCard() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.people_outline_rounded,
              size: 20,
              color: primary,
            ),
          ),

          const SizedBox(width: 11),

          const Expanded(
            child: Text(
              'Travellers',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: text,
              ),
            ),
          ),

          _counterButton(
            icon: Icons.remove_rounded,
            onTap: () {
              if (travellers > 1) {
                setState(() {
                  travellers--;
                });
              }
            },
          ),

          SizedBox(
            width: 35,
            child: Text(
              '$travellers',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: primary,
              ),
            ),
          ),

          _counterButton(
            icon: Icons.add_rounded,
            onTap: () {
              setState(() {
                travellers++;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _counterButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 17, color: primary),
      ),
    );
  }
}
