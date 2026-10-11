import 'package:flutter/material.dart';
import 'package:travel_planner/screens/food_recommendations.dart';
import 'package:travel_planner/screens/getting_around.dart';
import 'package:travel_planner/screens/accommodation.dart';
import 'package:travel_planner/screens/safety_prep_page.dart';
import 'package:travel_planner/screens/getting_there.dart';
import 'package:travel_planner/screens/packing_checklist.dart';

class TripResultPage extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final double userBudget;
  final int travellerCount;
  final DateTime startDate;
  final DateTime endDate;

  const TripResultPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.userBudget,
    required this.travellerCount,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<TripResultPage> createState() => _TripResultPageState();
}

class _TripResultPageState extends State<TripResultPage> {
  // SafeTrail theme colors.
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color cardColor = Color(0xFFFFFDFC);
  static const Color mainText = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color borderColor = Color(0xFFE7DFD8);

  // Selected accommodation price per night.
  // 0 means the user has not selected a stay yet.
  double selectedStayPrice = 0;

  double selectedFoodCost = 0;
  double selectedFlightPrice = 0;
  Set<int> selectedFoodIndexes = {};

  String _formatDate(DateTime date) {
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

  int _getTripDays() {
    return int.tryParse(widget.duration.split(' ').first) ?? 1;
  }

  // Temporary travel cost estimate.
  // Replace with actual/API data when travel pricing is integrated.
  double _getTravelCost() {
    if (selectedFlightPrice > 0) {
      return selectedFlightPrice * widget.travellerCount;
    }

    switch (widget.destination) {
      case 'Paris, France':
        return 25000;
      case 'Dubai, UAE':
        return 22000;
      case 'Singapore':
        return 20000;
      case 'London, UK':
        return 30000;
      case 'Tokyo, Japan':
        return 28000;
      case 'Bangkok, Thailand':
        return 18000;
      case 'Rome, Italy':
        return 25000;
      case 'New York, USA':
        return 35000;
      default:
        return 20000;
    }
  }

  // Temporary food estimate.
  // Uses the selected food total when a selection has been returned.
  double _getFoodCost() {
    double foodPerPersonPerDay;

    switch (widget.destination) {
      case 'Paris, France':
        foodPerPersonPerDay = 1800;
        break;
      case 'Dubai, UAE':
        foodPerPersonPerDay = 1600;
        break;
      case 'Singapore':
        foodPerPersonPerDay = 1800;
        break;
      case 'London, UK':
        foodPerPersonPerDay = 2200;
        break;
      case 'Tokyo, Japan':
        foodPerPersonPerDay = 1700;
        break;
      case 'Bangkok, Thailand':
        foodPerPersonPerDay = 1000;
        break;
      case 'Rome, Italy':
        foodPerPersonPerDay = 1800;
        break;
      case 'New York, USA':
        foodPerPersonPerDay = 2500;
        break;
      default:
        foodPerPersonPerDay = 1500;
    }

    return foodPerPersonPerDay * _getTripDays() * widget.travellerCount;
  }

  // Temporary local transport estimate.
  // Replace with actual transport selection/API data later.
  double _getTransportCost() {
    double transportPerDay;

    switch (widget.destination) {
      case 'Paris, France':
        transportPerDay = 700;
        break;
      case 'Dubai, UAE':
        transportPerDay = 800;
        break;
      case 'Singapore':
        transportPerDay = 700;
        break;
      case 'London, UK':
        transportPerDay = 900;
        break;
      case 'Tokyo, Japan':
        transportPerDay = 800;
        break;
      case 'Bangkok, Thailand':
        transportPerDay = 500;
        break;
      case 'Rome, Italy':
        transportPerDay = 700;
        break;
      case 'New York, USA':
        transportPerDay = 1000;
        break;
      default:
        transportPerDay = 600;
    }

    return transportPerDay * _getTripDays();
  }

  // Temporary activities estimate.
  // Replace with selected activities/API data when available.
  double _getActivitiesCost() {
    double activityPerPerson;

    switch (widget.destination) {
      case 'Paris, France':
        activityPerPerson = 5000;
        break;
      case 'Dubai, UAE':
        activityPerPerson = 6000;
        break;
      case 'Singapore':
        activityPerPerson = 5000;
        break;
      case 'London, UK':
        activityPerPerson = 6000;
        break;
      case 'Tokyo, Japan':
        activityPerPerson = 5000;
        break;
      case 'Bangkok, Thailand':
        activityPerPerson = 3500;
        break;
      case 'Rome, Italy':
        activityPerPerson = 5000;
        break;
      case 'New York, USA':
        activityPerPerson = 7000;
        break;
      default:
        activityPerPerson = 4000;
    }

    return activityPerPerson * widget.travellerCount;
  }

  // Accommodation cost based on the selected price per night.
  double _getAccommodationCost() {
    if (selectedStayPrice <= 0) {
      return 0;
    }

    return selectedStayPrice * _getTripDays();
  }

  double _getEstimatedTripCost() {
    final travelCost = _getTravelCost();
    final accommodationCost = _getAccommodationCost();
    final foodCost = selectedFoodCost > 0 ? selectedFoodCost : _getFoodCost();
    final transportCost = _getTransportCost();
    final activitiesCost = _getActivitiesCost();

    return travelCost +
        accommodationCost +
        foodCost +
        transportCost +
        activitiesCost;
  }

  String _getBudgetMessage(double estimatedCost) {
    final difference = widget.userBudget - estimatedCost;

    if (difference >= 0) {
      return 'You have approximately ₹${difference.toStringAsFixed(0)} remaining.';
    }

    return 'You may need approximately ₹${(-difference).toStringAsFixed(0)} more.';
  }

  bool _isBudgetEnough(double estimatedCost) {
    return widget.userBudget >= estimatedCost;
  }

  @override
  Widget build(BuildContext context) {
    final estimatedCost = _getEstimatedTripCost();
    final budgetEnough = _isBudgetEnough(estimatedCost);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: cardColor,
        elevation: 0,
        title: const Text(
          'Your Trip',
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
                'Your Trip Plan',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'Plan your ${widget.destination} trip at your own pace.',
                style: const TextStyle(fontSize: 14, color: secondaryText),
              ),
              const SizedBox(height: 20),

              // TRIP INFORMATION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: highlight.withOpacity(0.45),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: primary,
                            size: 23,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Destination',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: secondaryText,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                widget.destination,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Divider(color: borderColor),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _tripDetail(
                            Icons.calendar_month_outlined,
                            'Dates',
                            '${_formatDate(widget.startDate)}\n${_formatDate(widget.endDate)}',
                          ),
                        ),
                        Expanded(
                          child: _tripDetail(
                            Icons.timelapse_outlined,
                            'Duration',
                            widget.duration,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _tripDetail(
                            Icons.people_outline,
                            'Travellers',
                            '${widget.travellerCount}',
                          ),
                        ),
                        Expanded(
                          child: _tripDetail(
                            Icons.account_balance_wallet_outlined,
                            'Budget',
                            '₹${widget.userBudget.toStringAsFixed(0)}',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // COST ESTIMATE
              const Text(
                'Trip Cost Estimate',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'See how much money you may need for this trip.',
                style: TextStyle(fontSize: 13, color: secondaryText),
              ),
              const SizedBox(height: 13),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: budgetEnough
                      ? const Color(0xFFF3E9E5)
                      : const Color(0xFFFFEEE5),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: budgetEnough
                        ? accent.withOpacity(0.55)
                        : const Color(0xFFE6B49D),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          budgetEnough
                              ? Icons.account_balance_wallet_outlined
                              : Icons.warning_amber_rounded,
                          color: budgetEnough
                              ? primary
                              : const Color(0xFFAD5638),
                          size: 23,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'Estimated Trip Cost',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: mainText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Estimated trip cost',
                      style: TextStyle(fontSize: 12, color: secondaryText),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹${estimatedCost.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: primary,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Divider(color: borderColor),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Your budget',
                          style: TextStyle(fontSize: 13, color: secondaryText),
                        ),
                        Text(
                          '₹${widget.userBudget.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: mainText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _getBudgetMessage(estimatedCost),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: budgetEnough ? primary : const Color(0xFFAD5638),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      budgetEnough
                          ? '✓ Your current budget should be enough for this trip.'
                          : '⚠ Your current budget may not be enough for this trip.',
                      style: const TextStyle(
                        fontSize: 12,
                        color: secondaryText,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ACCOMMODATION COST
                    if (selectedStayPrice > 0) ...[
                      const Divider(color: borderColor),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Accommodation',
                            style: TextStyle(
                              fontSize: 13,
                              color: secondaryText,
                            ),
                          ),
                          Text(
                            '₹${_getAccommodationCost().toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: mainText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '₹${selectedStayPrice.toStringAsFixed(0)} × ${_getTripDays()} nights',
                        style: const TextStyle(
                          fontSize: 11,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Plan Your Trip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Choose what you want to plan first.',
                style: TextStyle(fontSize: 13, color: secondaryText),
              ),
              const SizedBox(height: 13),

              // FOOD
              _planningCard(
                context: context,
                icon: Icons.restaurant_outlined,
                title: 'Food',
                subtitle: 'Set preferences and discover food options',
                onTap: () async {
                  final result = await Navigator.push<Map<String, dynamic>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodRecommendations(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                        travellerCount: widget.travellerCount,
                        userBudget: widget.userBudget,
                        initialSelectedFoods: selectedFoodIndexes,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      selectedFoodIndexes = Set<int>.from(
                        result['selectedFoods'] as Set<int>,
                      );
                      selectedFoodCost = (result['total'] as num).toDouble();
                    });
                  }
                },
              ),

              const SizedBox(height: 10),

              // GETTING THERE
              _planningCard(
                context: context,
                icon: Icons.flight_takeoff_outlined,
                title: 'Getting There',
                subtitle: 'Find flights to your destination',
                onTap: () async {
                  final selectedPrice = await Navigator.push<double>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GettingTherePage(
                        destination: widget.destination,
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                        travellerCount: widget.travellerCount,
                        userBudget: widget.userBudget,
                      ),
                    ),
                  );

                  if (selectedPrice != null) {
                    setState(() {
                      selectedFlightPrice = selectedPrice;
                    });
                  }
                },
              ),

              const SizedBox(height: 10),

              // ACCOMMODATION
              _planningCard(
                context: context,
                icon: Icons.hotel_outlined,
                title: 'Accommodation',
                subtitle: 'Choose a stay that fits your budget',
                onTap: () async {
                  final selectedPrice = await Navigator.push<double>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StaySuggestionsPage(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                        travellerCount: widget.travellerCount,
                        userBudget: widget.userBudget,
                      ),
                    ),
                  );

                  if (selectedPrice != null) {
                    setState(() {
                      selectedStayPrice = selectedPrice;
                    });
                  }
                },
              ),

              const SizedBox(height: 10),

              // GETTING AROUND
              _planningCard(
                context: context,
                icon: Icons.directions_transit_outlined,
                title: 'Getting Around',
                subtitle: 'Plan transport within the destination',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GettingAroundPage(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                        travellerCount: widget.travellerCount,
                        userBudget: widget.userBudget,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // SAFETY
              _planningCard(
                context: context,
                icon: Icons.shield_outlined,
                title: 'Safety & Preparation',
                subtitle: 'Complete your pre-trip checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SafetyPrepPage(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                        travellerCount: widget.travellerCount,
                        userBudget: widget.userBudget,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // PACKING
              _planningCard(
                context: context,
                icon: Icons.luggage_outlined,
                title: 'Packing Checklist',
                subtitle: 'Prepare everything you need for your trip',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PackingChecklistPage(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // INFORMATION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: highlight.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, size: 21, color: primary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'How we estimated your trip',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: mainText,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'The estimate considers travel, accommodation, food, local transport and activities based on your destination, trip duration and number of travellers.',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.4,
                              color: secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'You can return to this page anytime and continue planning another section.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: secondaryText),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tripDetail(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 19, color: primary),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 11, color: secondaryText),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: mainText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _planningCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: highlight.withOpacity(0.45),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: primary, size: 23),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: mainText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: secondaryText),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
