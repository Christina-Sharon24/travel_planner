import 'package:flutter/material.dart';
import 'package:travel_planner/screens/trip_config.dart';
import 'package:travel_planner/screens/visa_entry.dart';
import 'package:travel_planner/screens/travel_rules.dart';
import 'package:travel_planner/screens/currency_page.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  // SafeTrail theme
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color cardColor = Color(0xFFFFFDFC);
  static const Color mainText = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);
  static const Color borderColor = Color(0xFFE7DFD8);

  void _openScreen(BuildContext context, String screen) {
    const destination = 'Tokyo, Japan';

    switch (screen) {
      case 'visa':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VisaEntryPage(destination: destination),
          ),
        );
        break;

      case 'rules':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TravelRulesPage(destination: destination),
          ),
        );
        break;

      case 'currency':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CurrencyPage(destination: destination),
          ),
        );
        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$screen screen will be connected next.'),
            backgroundColor: primary,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.explore_rounded,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SAFETRAIL',
                          style: TextStyle(
                            color: mainText,
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Travel prepared. Travel better.',
                          style: TextStyle(color: secondaryText, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: borderColor),
                    ),
                    child: const Icon(
                      Icons.person_outline_rounded,
                      color: primary,
                      size: 21,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Welcome section
              const Text(
                'Where are you\nheading next?',
                style: TextStyle(
                  color: mainText,
                  fontSize: 29,
                  height: 1.12,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 9),

              const Text(
                'Plan your stay, discover places and prepare\n'
                'for a smoother trip.',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),

              // Plan a new trip
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TripPlanPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_rounded, size: 21),
                      SizedBox(width: 8),
                      Text(
                        'Plan a New Trip',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Your trip section
              const Text(
                'YOUR TRIP',
                style: TextStyle(
                  color: mainText,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderColor),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.luggage_outlined, size: 38, color: primary),
                    SizedBox(height: 10),
                    Text(
                      'No trip planned yet',
                      style: TextStyle(
                        color: mainText,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Create a trip to start exploring destinations, '
                      'travel information and useful planning tools.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Quick access
              const Text(
                'QUICK ACCESS',
                style: TextStyle(
                  color: mainText,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),

              const SizedBox(height: 12),

              LayoutBuilder(
                builder: (context, constraints) {
                  const spacing = 10.0;
                  final cardWidth = (constraints.maxWidth - spacing * 2) / 3;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: _quickAccessCard(
                          icon: Icons.place_outlined,
                          title: 'Places',
                          subtitle: 'Explore',
                          backgroundColor: highlight,
                          iconColor: primary,
                          onTap: () => _openScreen(context, 'places'),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _quickAccessCard(
                          icon: Icons.cloud_outlined,
                          title: 'Weather',
                          subtitle: 'Forecast',
                          backgroundColor: const Color(0xFFF0E8E5),
                          iconColor: primary,
                          onTap: () => _openScreen(context, 'weather'),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _quickAccessCard(
                          icon: Icons.restaurant_outlined,
                          title: 'Food',
                          subtitle: 'Local picks',
                          backgroundColor: const Color(0xFFF5E5DD),
                          iconColor: accent,
                          onTap: () => _openScreen(context, 'food'),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _quickAccessCard(
                          icon: Icons.fact_check_outlined,
                          title: 'Visa & Entry',
                          subtitle: 'Documents',
                          backgroundColor: highlight,
                          iconColor: primary,
                          onTap: () => _openScreen(context, 'visa'),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _quickAccessCard(
                          icon: Icons.gavel_outlined,
                          title: 'Travel Rules',
                          subtitle: 'Local guidance',
                          backgroundColor: const Color(0xFFF5E5DD),
                          iconColor: accent,
                          onTap: () => _openScreen(context, 'rules'),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _quickAccessCard(
                          icon: Icons.currency_exchange_rounded,
                          title: 'Currency',
                          subtitle: 'Money matters',
                          backgroundColor: const Color(0xFFF0E8E5),
                          iconColor: primary,
                          onTap: () => _openScreen(context, 'currency'),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              // Travel reminder
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5E5DD),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: accent.withOpacity(0.35)),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline_rounded, color: primary, size: 19),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Before you travel, check your documents, '
                        'accommodation details and emergency contacts.',
                        style: TextStyle(
                          color: mainText,
                          fontSize: 11,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAccessCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 14, 8, 13),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 19),
            ),
            const SizedBox(height: 11),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: mainText,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: secondaryText, fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}
