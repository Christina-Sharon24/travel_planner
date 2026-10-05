import 'package:flutter/material.dart';
import 'package:travel_planner/screens/getting_around.dart';

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
  String selectedStyle = 'Local / Native';
  String selectedMeal = 'Budget meals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Preferences', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select your culinary style',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF004D40))),
            const SizedBox(height: 20),
            const Text('DIET TYPE',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Vegetarian', 'Non-Vegetarian', 'Vegan'].map((diet) {
                final isSelected = selectedDiet == diet;
                return ChoiceChip(
                  label: Text(diet),
                  selected: isSelected,
                  selectedColor: const Color(0xFF00796B),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
                  onSelected: (val) => setState(() => selectedDiet = diet),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('FOOD STYLE',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Local / Native', 'Familiar food', 'Mix of both'].map((style) {
                final isSelected = selectedStyle == style;
                return ChoiceChip(
                  label: Text(style),
                  selected: isSelected,
                  selectedColor: const Color(0xFF00796B),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
                  onSelected: (val) => setState(() => selectedStyle = style),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('MEAL PREFERENCE',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ['Budget meals', 'Restaurants', 'Cafe', 'Street food'].map((meal) {
                final isSelected = selectedMeal == meal;
                return ChoiceChip(
                  label: Text(meal),
                  selected: isSelected,
                  selectedColor: const Color(0xFF00796B),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
                  onSelected: (val) => setState(() => selectedMeal = meal),
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GettingAroundPage4(
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
                  backgroundColor: const Color(0xFF00796B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                child: const Text('Continue to Transport →',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}