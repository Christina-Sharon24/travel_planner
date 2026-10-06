import 'package:flutter/material.dart';
import 'package:travel_planner/screens/trip_result.dart';

class StaySuggestionsPage5 extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const StaySuggestionsPage5({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<StaySuggestionsPage5> createState() => _StaySuggestionsPage5State();
}

class _StaySuggestionsPage5State extends State<StaySuggestionsPage5> {
  String selectedStay = 'Private Room';

  @override
  Widget build(BuildContext context) {
    final double baseNightCost =
        widget.userBudget * 0.06 * widget.travellerCount;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Stay Suggestions',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF004D40),
                  Color(0xFF00796B),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _budgetInfoItem(
                  'TOTAL BUDGET',
                  '₹ ${widget.userBudget.toStringAsFixed(0)}',
                ),
                _budgetInfoItem(
                  'DURATION',
                  widget.duration,
                ),
                _budgetInfoItem(
                  'TRAVELLERS',
                  widget.travellers,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'BUDGET FRIENDLY',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
            ),
          ),
          const SizedBox(height: 10),
          _buildStayCard(
            title: 'PRIVATE ROOM',
            nightRate: baseNightCost,
            totalRate: baseNightCost * 5,
            features:
            '• Private room\n• Attached bathroom\n• 24-hour reception\n• Near public transport',
            badge: '',
            icon: Icons.meeting_room,
          ),
          const SizedBox(height: 15),
          const Text(
            'COMFORT OPTION',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
            ),
          ),
          const SizedBox(height: 10),
          _buildStayCard(
            title: 'HOTEL SUITE',
            nightRate: baseNightCost * 1.5,
            totalRate: baseNightCost * 1.5 * 5,
            features:
            '• King size bed\n• Breakfast included\n• Free Wi-Fi & Gym\n• City center view',
            badge: 'POPULAR CHOICE 🔥',
            icon: Icons.hotel,
          ),
          const SizedBox(height: 15),
          const Text(
            'LOWER COST OPTION',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
            ),
          ),
          const SizedBox(height: 10),
          _buildStayCard(
            title: 'HOSTEL PRIVATE ROOM',
            nightRate: baseNightCost * 0.7,
            totalRate: baseNightCost * 0.7 * 5,
            features:
            '• Private room\n• Common lounge\n• Luggage storage\n• Budget friendly',
            badge: '',
            icon: Icons.house_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildStayCard({
    required String title,
    required double nightRate,
    required double totalRate,
    required String features,
    required String badge,
    required IconData icon,
  }) {
    final bool isSelected = selectedStay == title;

    return GestureDetector(
      onTap: () => setState(() => selectedStay = title),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00796B)
                : Colors.transparent,
            width: 2.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2F1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: const Color(0xFF00796B),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF004D40),
                      ),
                    ),
                  ],
                ),
                if (badge.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${nightRate.toStringAsFixed(0)} / night',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '₹${totalRate.toStringAsFixed(0)} total',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF00796B),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Text(
              features,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() => selectedStay = title);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TripResultPage6(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                        userBudget: widget.userBudget,
                        travellerCount: widget.travellerCount,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected
                      ? const Color(0xFF00796B)
                      : Colors.grey[200],
                  foregroundColor:
                  isSelected ? Colors.white : Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isSelected ? 'Selected ✓' : 'Select Option',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _budgetInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}