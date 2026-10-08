import 'package:flutter/material.dart';

class FoodRecommendations extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;
  final Set<int> initialSelectedFoods;

  const FoodRecommendations({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
    required this.initialSelectedFoods,
  });

  @override
  State<FoodRecommendations> createState() => _FoodRecommendationsState();
}

class _FoodRecommendationsState extends State<FoodRecommendations> {
  String selectedCategory = 'Local';

  late Set<int> selectedFoods;
  @override
  void initState() {
    super.initState();
    selectedFoods = {...widget.initialSelectedFoods};
  }

  final List<String> categories = [
    'Local',
    'Vegetarian',
    'Café',
    'Street Food',
    'Restaurant',
    'Quick & Casual',
  ];

  List<Map<String, dynamic>> getFoodOptions() {
    switch (widget.destination) {
      case 'Paris, France':
        return [
          {
            'name': 'Croissant & Coffee',
            'place': 'Café de Flore',
            'location': 'Saint-Germain, Paris',
            'price': 900,
            'category': 'Café',
            'rating': '4.4',
            'icon': Icons.coffee_outlined,
          },
          {
            'name': 'Ratatouille',
            'place': 'Le Potager du Marais',
            'location': 'Le Marais, Paris',
            'price': 1200,
            'category': 'Local',
            'rating': '4.5',
            'icon': Icons.restaurant_outlined,
          },
          {
            'name': 'French Onion Soup',
            'place': 'Bouillon Chartier',
            'location': 'Grands Boulevards, Paris',
            'price': 800,
            'category': 'Local',
            'rating': '4.3',
            'icon': Icons.soup_kitchen_outlined,
          },
          {
            'name': 'Vegetable Quiche',
            'place': 'Le Pain Quotidien',
            'location': 'Central Paris',
            'price': 700,
            'category': 'Vegetarian',
            'rating': '4.2',
            'icon': Icons.eco_outlined,
          },
          {
            'name': 'French Crepe',
            'place': 'Crêperie Saint-Eustache',
            'location': 'Les Halles, Paris',
            'price': 650,
            'category': 'Street Food',
            'rating': '4.4',
            'icon': Icons.fastfood_outlined,
          },
          {
            'name': 'Baguette Sandwich',
            'place': 'Paul Bakery',
            'location': 'Central Paris',
            'price': 600,
            'category': 'Quick & Casual',
            'rating': '4.1',
            'icon': Icons.lunch_dining_outlined,
          },
        ];

      case 'Dubai, UAE':
        return [
          {
            'name': 'Chicken Shawarma',
            'place': 'Local Shawarma Café',
            'location': 'Deira, Dubai',
            'price': 500,
            'category': 'Street Food',
            'rating': '4.5',
            'icon': Icons.fastfood_outlined,
          },
          {
            'name': 'Arabic Mezze',
            'place': 'Al Fanar Restaurant',
            'location': 'Dubai Festival City',
            'price': 1400,
            'category': 'Local',
            'rating': '4.4',
            'icon': Icons.restaurant_outlined,
          },
          {
            'name': 'Vegetable Hummus Bowl',
            'place': 'Arabian Café',
            'location': 'Downtown Dubai',
            'price': 900,
            'category': 'Vegetarian',
            'rating': '4.3',
            'icon': Icons.eco_outlined,
          },
          {
            'name': 'Arabic Coffee & Dates',
            'place': 'Local Café',
            'location': 'Al Seef, Dubai',
            'price': 550,
            'category': 'Café',
            'rating': '4.4',
            'icon': Icons.coffee_outlined,
          },
        ];

      case 'Singapore':
        return [
          {
            'name': 'Chicken Rice',
            'place': 'Maxwell Food Centre',
            'location': 'Chinatown, Singapore',
            'price': 550,
            'category': 'Local',
            'rating': '4.5',
            'icon': Icons.rice_bowl_outlined,
          },
          {
            'name': 'Vegetable Noodles',
            'place': 'Lau Pa Sat',
            'location': 'Downtown Singapore',
            'price': 650,
            'category': 'Vegetarian',
            'rating': '4.2',
            'icon': Icons.eco_outlined,
          },
          {
            'name': 'Kaya Toast & Coffee',
            'place': 'Ya Kun Kaya Toast',
            'location': 'Central Singapore',
            'price': 450,
            'category': 'Café',
            'rating': '4.4',
            'icon': Icons.coffee_outlined,
          },
          {
            'name': 'Satay',
            'place': 'Lau Pa Sat',
            'location': 'Downtown Singapore',
            'price': 700,
            'category': 'Street Food',
            'rating': '4.5',
            'icon': Icons.fastfood_outlined,
          },
        ];

      case 'London, UK':
        return [
          {
            'name': 'Fish & Chips',
            'place': 'Golden Union',
            'location': 'Soho, London',
            'price': 1100,
            'category': 'Local',
            'rating': '4.4',
            'icon': Icons.restaurant_outlined,
          },
          {
            'name': 'Vegetable Pie',
            'place': 'The Ivy',
            'location': 'Covent Garden, London',
            'price': 1300,
            'category': 'Vegetarian',
            'rating': '4.3',
            'icon': Icons.eco_outlined,
          },
          {
            'name': 'English Breakfast',
            'place': 'The Breakfast Club',
            'location': 'Soho, London',
            'price': 950,
            'category': 'Café',
            'rating': '4.5',
            'icon': Icons.coffee_outlined,
          },
          {
            'name': 'Chicken Wrap',
            'place': 'Pret A Manger',
            'location': 'Central London',
            'price': 700,
            'category': 'Quick & Casual',
            'rating': '4.2',
            'icon': Icons.lunch_dining_outlined,
          },
        ];

      case 'Tokyo, Japan':
        return [
          {
            'name': 'Ramen',
            'place': 'Local Ramen House',
            'location': 'Shinjuku, Tokyo',
            'price': 900,
            'category': 'Local',
            'rating': '4.6',
            'icon': Icons.ramen_dining_outlined,
          },
          {
            'name': 'Vegetable Sushi',
            'place': 'Sushi Restaurant',
            'location': 'Shibuya, Tokyo',
            'price': 1200,
            'category': 'Vegetarian',
            'rating': '4.4',
            'icon': Icons.set_meal_outlined,
          },
          {
            'name': 'Matcha Dessert',
            'place': 'Matcha Café',
            'location': 'Asakusa, Tokyo',
            'price': 650,
            'category': 'Café',
            'rating': '4.5',
            'icon': Icons.coffee_outlined,
          },
          {
            'name': 'Takoyaki',
            'place': 'Street Food Stall',
            'location': 'Shibuya, Tokyo',
            'price': 500,
            'category': 'Street Food',
            'rating': '4.4',
            'icon': Icons.fastfood_outlined,
          },
        ];

      default:
        return [
          {
            'name': 'Local Special',
            'place': 'Recommended Local Restaurant',
            'location': 'City Centre',
            'price': 900,
            'category': 'Local',
            'rating': '4.3',
            'icon': Icons.restaurant_outlined,
          },
          {
            'name': 'Vegetarian Bowl',
            'place': 'Green Café',
            'location': 'City Centre',
            'price': 750,
            'category': 'Vegetarian',
            'rating': '4.2',
            'icon': Icons.eco_outlined,
          },
          {
            'name': 'Coffee & Snack',
            'place': 'Local Café',
            'location': 'City Centre',
            'price': 500,
            'category': 'Café',
            'rating': '4.4',
            'icon': Icons.coffee_outlined,
          },
        ];
    }
  }

  double get selectedTotal {
    final foods = getFoodOptions();

    double total = 0;

    for (final index in selectedFoods) {
      total += (foods[index]['price'] as int).toDouble();
    }

    return total * widget.travellerCount;
  }

  double get estimatedFoodBudget {
    final days =
        int.tryParse(widget.duration.replaceAll(RegExp(r'[^0-9]'), '')) ?? 1;

    return days * widget.travellerCount * 1200;
  }

  @override
  Widget build(BuildContext context) {
    final allFoods = getFoodOptions();

    final filteredFoods = allFoods.where((food) {
      return food['category'] == selectedCategory;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Food',
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
                'Explore food your way',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              Text(
                'Discover food options in ${widget.destination}. '
                'You can decide what to eat during your trip.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 20),

              // Estimated food budget
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Color(0xFF155E75),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Estimated food budget',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),

                          const SizedBox(height: 3),

                          Text(
                            '₹${estimatedFoodBudget.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF183B4E),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            'Approximate amount for the whole trip',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'What are you looking for?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 7),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final selected = category == selectedCategory;

                    return ChoiceChip(
                      label: Text(
                        category,
                        style: TextStyle(
                          fontSize: 12,
                          color: selected
                              ? Colors.white
                              : const Color(0xFF183B4E),
                          fontWeight: selected
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                      ),
                      selected: selected,
                      selectedColor: const Color(0xFF155E75),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFD9E2E7)),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Food options',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF183B4E),
                      ),
                    ),
                  ),

                  Text(
                    '${filteredFoods.length} options',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 11),

              ...filteredFoods.map((food) {
                final originalIndex = allFoods.indexOf(food);
                final selected = selectedFoods.contains(originalIndex);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: _foodCard(
                    food: food,
                    selected: selected,
                    onTap: () {
                      setState(() {
                        if (selected) {
                          selectedFoods.remove(originalIndex);
                        } else {
                          selectedFoods.add(originalIndex);
                        }
                      });
                    },
                  ),
                );
              }),

              const SizedBox(height: 8),

              // Selected food summary
              if (selectedFoods.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: const Color(0xFFD9E2E7)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your selected food',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF183B4E),
                        ),
                      ),

                      const SizedBox(height: 7),

                      Text(
                        '${selectedFoods.length} option${selectedFoods.length == 1 ? '' : 's'} selected',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),

                      const SizedBox(height: 9),

                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Estimated cost for your group',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),

                          Text(
                            '₹${selectedTotal.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF155E75),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              // Information box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F5F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 19,
                      color: Color(0xFF155E75),
                    ),

                    SizedBox(width: 9),

                    Expanded(
                      child: Text(
                        'You do not have to plan every meal now. '
                        'Save food options you like and decide what to eat '
                        'when you are actually travelling.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'selectedFoods': selectedFoods,
                      'total':selectedTotal
                    });
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
                    'Done',
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

  Widget _foodCard({
    required Map<String, dynamic> food,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: selected ? const Color(0xFF155E75) : const Color(0xFFD9E2E7),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4F1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                food['icon'] as IconData,
                color: const Color(0xFF155E75),
                size: 23,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food['name'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF183B4E),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    food['place'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 3),

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
                          food['location'] as String,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      Text(
                        '₹${food['price']}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF155E75),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Color(0xFFE39B24),
                      ),

                      const SizedBox(width: 3),

                      Text(
                        food['rating'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 7),

            Icon(
              selected ? Icons.check_circle : Icons.add_circle_outline,
              color: selected
                  ? const Color(0xFF155E75)
                  : const Color(0xFF94A3B8),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
