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

  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color cardColor = Color(0xFFFFFDFC);
  static const Color mainText = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color borderColor = Color(0xFFE7DFD8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Trip Ready',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Your trip is ready!',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: mainText,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Everything is prepared for $destination',
            style: const TextStyle(fontSize: 14, color: secondaryText),
          ),
          const SizedBox(height: 23),

          const Text(
            'TRIP OVERVIEW',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: primary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  title: 'Destination',
                  value: destination,
                ),
                const Divider(height: 22, color: borderColor),
                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  title: 'Duration',
                  value: duration,
                ),
                const Divider(height: 22, color: borderColor),
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
              color: primary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: borderColor),
            ),
            child: const Column(
              children: [
                _CheckItem(icon: Icons.hotel_outlined, text: 'Stay selected'),
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
              color: primary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: highlight.withOpacity(0.45),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: primary,
                  size: 25,
                ),
                const SizedBox(height: 7),
                Text(
                  '₹${userBudget.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: mainText,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Your planned trip budget',
                  style: TextStyle(fontSize: 12, color: secondaryText),
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
                backgroundColor: primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Start Trip →',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
            color: TripReadyPage.highlight.withOpacity(0.45),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, color: TripReadyPage.primary, size: 20),
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
                  color: TripReadyPage.secondaryText,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: TripReadyPage.mainText,
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

  const _CheckItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: TripReadyPage.accent,
            size: 19,
          ),
          const SizedBox(width: 10),
          Icon(icon, color: TripReadyPage.primary, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: TripReadyPage.mainText,
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
    return const Divider(height: 1, color: TripReadyPage.borderColor);
  }
}
