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
  final TextEditingController budgetController =
  TextEditingController(text: '50000');
  final TextEditingController destinationController =
  TextEditingController(text: 'Paris, France');

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Trip',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Configure your ideal travel experience',
                style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            const Text('DESTINATION',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 6),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                prefixIcon:
                const Icon(Icons.location_on, color: Color(0xFF00796B)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            const Text('TRAVELLING AS',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ['Solo', 'Couple', 'Family', 'Friends'].map((type) {
                final isSelected = selectedTravelType == type;
                return ChoiceChip(
                  label: Text(type),
                  selected: isSelected,
                  selectedColor: const Color(0xFF00796B),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold),
                  onSelected: (val) =>
                      setState(() => selectedTravelType = type),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('TRIP DURATION',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.remove_circle, color: Color(0xFF00796B), size: 28),
                      onPressed: () => setState(
                              () => days = days > 1 ? days - 1 : 1)),
                  Text('$days days',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF004D40))),
                  IconButton(
                      icon: const Icon(Icons.add_circle, color: Color(0xFF00796B), size: 28),
                      onPressed: () => setState(() => days++)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('TRAVELLERS',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.remove_circle, color: Color(0xFF00796B), size: 28),
                      onPressed: () => setState(() =>
                      travellers = travellers > 1 ? travellers - 1 : 1)),
                  Text('$travellers travellers',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF004D40))),
                  IconButton(
                      icon: const Icon(Icons.add_circle, color: Color(0xFF00796B), size: 28),
                      onPressed: () => setState(() => travellers++)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('APPROX. BUDGET (₹)',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 6),
            TextField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹ ',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  final parsedBudget = double.tryParse(budgetController.text) ?? 50000;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodPreferencesPage3(
                        destination: destinationController.text,
                        duration: '$days days',
                        travellers: '$travellers travellers',
                        travellerCount: travellers,
                        userBudget: parsedBudget,
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
                child: const Text('Continue to Food Preferences →',
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