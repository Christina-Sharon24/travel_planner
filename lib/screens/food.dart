import 'package:flutter/material.dart';

import 'food_recommendations.dart';

class FoodPreferencesPage3 extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const FoodPreferencesPage3({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<FoodPreferencesPage3> createState() => _FoodPreferencesPage3State();
}

class _FoodPreferencesPage3State extends State<FoodPreferencesPage3> {
  String selectedDiet = 'Vegetarian';
  String selectedFoodType = 'Local Food';
  String selectedBudget = 'Budget';
  String selectedPreference = 'Street Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Food Preferences',
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
                'Food in ${widget.destination}',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Tell us what you like and we will find suitable food for you.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Diet',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              _selectionBox(
                options: ['Vegetarian', 'Non-Vegetarian', 'Vegan'],
                selected: selectedDiet,
                onSelected: (value) {
                  setState(() {
                    selectedDiet = value;
                  });
                },
              ),

              const SizedBox(height: 23),

              const Text(
                'What type of food would you like?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              _selectionBox(
                options: ['Local Food', 'Familiar Food', 'Mix of Both'],
                selected: selectedFoodType,
                onSelected: (value) {
                  setState(() {
                    selectedFoodType = value;
                  });
                },
              ),

              const SizedBox(height: 23),

              const Text(
                'Food Budget',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              _selectionBox(
                options: ['Budget', 'Moderate', 'Premium'],
                selected: selectedBudget,
                onSelected: (value) {
                  setState(() {
                    selectedBudget = value;
                  });
                },
              ),

              const SizedBox(height: 23),

              const Text(
                'Where would you prefer to eat?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              _selectionBox(
                options: ['Street Food', 'Restaurants', 'Cafes'],
                selected: selectedPreference,
                onSelected: (value) {
                  setState(() {
                    selectedPreference = value;
                  });
                },
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.restaurant_outlined,
                      size: 20,
                      color: Color(0xFF155E75),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'We will use your choices to show food recommendations for ${widget.destination}.',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodRecommendationsPage4(
                          destination: widget.destination,
                          duration: widget.duration,
                          travellers: widget.travellers,
                          travellerCount: widget.travellerCount,
                          userBudget: widget.userBudget,
                          diet: selectedDiet,
                          foodType: selectedFoodType,
                          foodBudget: selectedBudget,
                          foodPreference: selectedPreference,
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
                        'Find Food',
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

  Widget _selectionBox({
    required List<String> options,
    required String selected,
    required Function(String) onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        bool isSelected = selected == option;

        return GestureDetector(
          onTap: () {
            onSelected(option);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF155E75) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF155E75)
                    : const Color(0xFFD9E2E7),
              ),
            ),
            child: Text(
              option,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF183B4E),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
