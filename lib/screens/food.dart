import 'package:flutter/material.dart';
import 'food_recommendations.dart';

class FoodPage extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const FoodPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  Widget build(BuildContext context) {
    return FoodRecommendations(
      destination: destination,
      duration: duration,
      travellers: travellers,
      travellerCount: travellerCount,
      userBudget: userBudget,
      initialSelectedFoods: {},
    );
  }
}