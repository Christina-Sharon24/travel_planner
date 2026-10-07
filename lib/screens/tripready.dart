import 'package:flutter/material.dart';
import 'package:travel_planner/screens/tripmode.dart';

class TripReadyPage extends StatelessWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const TripReadyPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),

      appBar: AppBar(
        title: const Text(
          'Trip Ready',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF155E75),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // PAGE TITLE
          Text(
            'Your trip is ready!',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Color(0xFF183B4E),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            'Everything is prepared for $destination',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 23),


          const Text(
            'TRIP OVERVIEW',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: const Color(0xFFD9E2E7),
              ),
            ),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  title: 'Destination',
                  value: destination,
                ),

                const Divider(
                  height: 22,
                  color: Color(0xFFE6ECEF),
                ),

                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  title: 'Duration',
                  value: duration,
                ),

                const Divider(
                  height: 22,
                  color: Color(0xFFE6ECEF),
                ),

                _InfoRow(
                  icon: Icons.people_outline,
                  title: 'Travellers',
                  value: '$travellers • $travellerCount',
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'TRIP PREPARATION',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: const Color(0xFFD9E2E7),
              ),
            ),
            child: Column(
              children: const [
                _CheckItem(
                  icon: Icons.hotel_outlined,
                  text: 'Stay selected',
                ),
                _DividerLine(),
                _CheckItem(
                  icon: Icons.directions_bus_outlined,
                  text: 'Transport planned',
                ),
                _DividerLine(),
                _CheckItem(
                  icon: Icons.restaurant_outlined,
                  text: 'Food preferences set',
                ),
                _DividerLine(),
                _CheckItem(
                  icon: Icons.shield_outlined,
                  text: 'Safety information reviewed',
                ),
                _DividerLine(),
                _CheckItem(
                  icon: Icons.phone_outlined,
                  text: 'Emergency contacts ready',
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'TRIP BUDGET',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4F1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0xFF155E75),
                  size: 25,
                ),

                const SizedBox(height: 7),

                Text(
                  '₹${userBudget.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF183B4E),
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Your planned trip budget',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 23),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TripModePage(
                      destination: destination,
                      duration: duration,
                      travellers: travellers,
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

              child: const Text(
                'Start Trip →',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}



class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F4F1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF155E75),
            size: 20,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class _CheckItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CheckItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFF2A9D8F),
            size: 19,
          ),

          const SizedBox(width: 10),

          Icon(
            icon,
            color: const Color(0xFF155E75),
            size: 19,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF183B4E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: Color(0xFFE6ECEF),
    );
  }
}