import 'package:flutter/material.dart';

import 'getting_around.dart';

class FoodRecommendationsPage extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  final String diet;
  final String foodType;
  final String foodBudget;
  final String foodPreference;

  const FoodRecommendationsPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
    required this.diet,
    required this.foodType,
    required this.foodBudget,
    required this.foodPreference,
  });

  List<Map<String, dynamic>> getFoodList() {
    if (destination == 'Paris, France') {
      return [
        {
          'name': 'Crêpe',
          'description': 'Popular French street food',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.6',
          'price': '₹400',
          'icon': Icons.bakery_dining_outlined,
        },
        {
          'name': 'Baguette Sandwich',
          'description': 'Fresh French bread with simple fillings',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.4',
          'price': '₹350',
          'icon': Icons.lunch_dining_outlined,
        },
        {
          'name': 'Ratatouille',
          'description': 'Traditional vegetable dish',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.7',
          'price': '₹900',
          'icon': Icons.restaurant_outlined,
        },
        {
          'name': 'Croissant',
          'description': 'Classic French pastry',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.8',
          'price': '₹300',
          'icon': Icons.bakery_dining_outlined,
        },
        {
          'name': 'Chicken Baguette',
          'description': 'French bread with chicken filling',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹450',
          'icon': Icons.lunch_dining_outlined,
        },
      ];
    }

    if (destination == 'Dubai, UAE') {
      return [
        {
          'name': 'Shawarma',
          'description': 'Popular Middle Eastern street food',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Budget',
          'rating': '4.7',
          'price': '₹300',
          'icon': Icons.lunch_dining_outlined,
        },
        {
          'name': 'Falafel',
          'description': 'Crispy chickpea-based local favourite',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.6',
          'price': '₹250',
          'icon': Icons.restaurant_outlined,
        },
        {
          'name': 'Hummus Platter',
          'description': 'Creamy hummus with bread and vegetables',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.7',
          'price': '₹650',
          'icon': Icons.restaurant_outlined,
        },
        {
          'name': 'Chicken Mandi',
          'description': 'Fragrant rice with tender chicken',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Moderate',
          'rating': '4.8',
          'price': '₹850',
          'icon': Icons.rice_bowl_outlined,
        },
        {
          'name': 'Arabic Coffee',
          'description': 'Traditional coffee served with dates',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹250',
          'icon': Icons.local_cafe_outlined,
        },
      ];
    }

    if (destination == 'Singapore') {
      return [
        {
          'name': 'Vegetarian Noodles',
          'description': 'Local-style noodles with vegetables',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹400',
          'icon': Icons.ramen_dining_outlined,
        },
        {
          'name': 'Chicken Rice',
          'description': 'One of Singapore’s popular local dishes',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Budget',
          'rating': '4.7',
          'price': '₹450',
          'icon': Icons.rice_bowl_outlined,
        },
        {
          'name': 'Laksa',
          'description': 'Spicy noodle soup with rich flavours',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Moderate',
          'rating': '4.8',
          'price': '₹700',
          'icon': Icons.ramen_dining_outlined,
        },
        {
          'name': 'Kaya Toast',
          'description': 'Toast with coconut jam and coffee',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹300',
          'icon': Icons.bakery_dining_outlined,
        },
      ];
    }

    if (destination == 'London, UK') {
      return [
        {
          'name': 'Vegetable Pie',
          'description': 'Warm British-style vegetable pie',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.4',
          'price': '₹750',
          'icon': Icons.restaurant_outlined,
        },
        {
          'name': 'Fish and Chips',
          'description': 'Classic British meal',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Moderate',
          'rating': '4.6',
          'price': '₹900',
          'icon': Icons.lunch_dining_outlined,
        },
        {
          'name': 'English Breakfast',
          'description': 'Traditional breakfast served hot',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Moderate',
          'rating': '4.5',
          'price': '₹850',
          'icon': Icons.breakfast_dining_outlined,
        },
        {
          'name': 'Scone',
          'description': 'Classic British cafe snack',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.4',
          'price': '₹350',
          'icon': Icons.bakery_dining_outlined,
        },
      ];
    }

    if (destination == 'Tokyo, Japan') {
      return [
        {
          'name': 'Vegetable Sushi',
          'description': 'Fresh sushi rolls with vegetables',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.6',
          'price': '₹700',
          'icon': Icons.rice_bowl_outlined,
        },
        {
          'name': 'Ramen',
          'description': 'Popular Japanese noodle soup',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Budget',
          'rating': '4.8',
          'price': '₹650',
          'icon': Icons.ramen_dining_outlined,
        },
        {
          'name': 'Onigiri',
          'description': 'Convenient Japanese rice snack',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹250',
          'icon': Icons.rice_bowl_outlined,
        },
        {
          'name': 'Matcha Dessert',
          'description': 'Popular Japanese green tea dessert',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.6',
          'price': '₹500',
          'icon': Icons.cake_outlined,
        },
      ];
    }

    if (destination == 'Bangkok, Thailand') {
      return [
        {
          'name': 'Pad Thai',
          'description': 'Popular Thai stir-fried noodles',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.7',
          'price': '₹350',
          'icon': Icons.ramen_dining_outlined,
        },
        {
          'name': 'Mango Sticky Rice',
          'description': 'Classic Thai sweet dish',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.6',
          'price': '₹300',
          'icon': Icons.cake_outlined,
        },
        {
          'name': 'Tom Yum',
          'description': 'Spicy and sour Thai soup',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Non-Vegetarian',
          'budget': 'Moderate',
          'rating': '4.7',
          'price': '₹550',
          'icon': Icons.soup_kitchen_outlined,
        },
        {
          'name': 'Thai Iced Tea',
          'description': 'Sweet and creamy Thai tea',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹220',
          'icon': Icons.local_cafe_outlined,
        },
      ];
    }

    if (destination == 'Rome, Italy') {
      return [
        {
          'name': 'Margherita Pizza',
          'description': 'Classic Italian pizza',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.8',
          'price': '₹600',
          'icon': Icons.local_pizza_outlined,
        },
        {
          'name': 'Pasta',
          'description': 'Traditional Italian pasta',
          'category': 'Restaurant',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.7',
          'price': '₹750',
          'icon': Icons.ramen_dining_outlined,
        },
        {
          'name': 'Supplì',
          'description': 'Roman fried rice snack',
          'category': 'Street Food',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Budget',
          'rating': '4.5',
          'price': '₹300',
          'icon': Icons.lunch_dining_outlined,
        },
        {
          'name': 'Tiramisu',
          'description': 'Classic Italian coffee dessert',
          'category': 'Cafe',
          'type': 'Local Food',
          'diet': 'Vegetarian',
          'budget': 'Moderate',
          'rating': '4.8',
          'price': '₹500',
          'icon': Icons.cake_outlined,
        },
      ];
    }

    return [
      {
        'name': 'Local Vegetarian Meal',
        'description': 'A popular local vegetarian option',
        'category': 'Restaurant',
        'type': 'Local Food',
        'diet': 'Vegetarian',
        'budget': 'Budget',
        'rating': '4.5',
        'price': '₹500',
        'icon': Icons.restaurant_outlined,
      },
      {
        'name': 'Local Street Food',
        'description': 'Popular food option for travellers',
        'category': 'Street Food',
        'type': 'Local Food',
        'diet': 'Vegetarian',
        'budget': 'Budget',
        'rating': '4.4',
        'price': '₹300',
        'icon': Icons.lunch_dining_outlined,
      },
    ];
  }

  List<Map<String, dynamic>> getRecommendations() {
    List<Map<String, dynamic>> foods = getFoodList();

    List<Map<String, dynamic>> filtered = foods.where((food) {
      bool dietMatch = food['diet'] == diet;

      bool typeMatch = food['type'] == foodType || foodType == 'Mix of Both';

      bool budgetMatch = food['budget'] == foodBudget;

      bool preferenceMatch = food['category'] == foodPreference;

      return dietMatch && typeMatch && budgetMatch && preferenceMatch;
    }).toList();

    if (filtered.isEmpty) {
      filtered = foods.where((food) {
        return food['diet'] == diet;
      }).toList();
    }

    if (filtered.isEmpty) {
      filtered = foods;
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recommendations = getRecommendations();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Food Recommendations',
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
                'Food to try in $destination',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Recommendations based on your preferences.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  children: [
                    _tag(diet),
                    _tag(foodType),
                    _tag(foodBudget),
                    _tag(foodPreference),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              if (recommendations.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: Text(
                      'No matching food found.',
                      style: TextStyle(fontSize: 15, color: Color(0xFF64748B)),
                    ),
                  ),
                ),

              ...recommendations.map((food) => _foodCard(food)),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GettingAroundPage(
                          destination: destination,
                          duration: duration,
                          travellers: travellers,
                          travellerCount: travellerCount,
                          userBudget: userBudget,
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
                        'Continue to Transport',
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

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF183B4E),
        ),
      ),
    );
  }

  Widget _foodCard(Map<String, dynamic> food) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE1E8EC)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1E7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(food['icon'], color: const Color(0xFFE76F51), size: 25),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF183B4E),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  food['description'],
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF64748B),
                  ),
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: Color(0xFFE9A23B),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      food['rating'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF183B4E),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      food['category'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            food['price'],
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
            ),
          ),
        ],
      ),
    );
  }
}
