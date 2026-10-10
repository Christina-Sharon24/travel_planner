import 'package:flutter/material.dart';
import 'package:travel_planner/screens/trip_config.dart';
import 'package:travel_planner/screens/visa_entry.dart';
import 'package:travel_planner/screens/travel_rules.dart';
import 'package:travel_planner/screens/currency_page.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  static const Color primary = Color(0xFF155E75);
  static const Color teal = Color(0xFF2A9D8F);
  static const Color lightTeal = Color(0xFFE6F4F1);
  static const Color amber = Color(0xFFF4A261);
  static const Color lightAmber = Color(0xFFFFF1E7);
  static const Color background = Color(0xFFF8FAF9);
  static const Color textDark = Color(0xFF183B4E);
  static const Color textGrey = Color(0xFF64748B);

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
          SnackBar(content: Text('$screen screen will be connected next.')),
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
                            color: textDark,
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Travel prepared. Travel better.',
                          style: TextStyle(color: textGrey, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: const Icon(
                      Icons.person_outline_rounded,
                      color: textDark,
                      size: 21,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              const Text(
                'Where are you\nheading next?',
                style: TextStyle(
                  color: textDark,
                  fontSize: 29,
                  height: 1.12,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 9),

              const Text(
                'Plan your stay, discover places and prepare\nfor a smoother trip.',
                style: TextStyle(color: textGrey, fontSize: 13, height: 1.5),
              ),

              const SizedBox(height: 20),

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

              const Text(
                'YOUR TRIP',
                style: TextStyle(
                  color: textDark,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE7ECEF)),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.luggage_outlined, size: 38, color: primary),
                    SizedBox(height: 10),
                    Text(
                      'No trip planned yet',
                      style: TextStyle(
                        color: textDark,
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
                        color: textGrey,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'QUICK ACCESS',
                style: TextStyle(
                  color: textDark,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _quickAccessCard(
                    icon: Icons.place_outlined,
                    title: 'Places',
                    subtitle: 'Explore',
                    backgroundColor: lightTeal,
                    iconColor: primary,
                    onTap: () => _openScreen(context, 'places'),
                  ),
                  _quickAccessCard(
                    icon: Icons.cloud_outlined,
                    title: 'Weather',
                    subtitle: 'Forecast',
                    backgroundColor: const Color(0xFFEAF3FA),
                    iconColor: primary,
                    onTap: () => _openScreen(context, 'weather'),
                  ),
                  _quickAccessCard(
                    icon: Icons.restaurant_outlined,
                    title: 'Food',
                    subtitle: 'Local picks',
                    backgroundColor: lightAmber,
                    iconColor: const Color(0xFFB86628),
                    onTap: () => _openScreen(context, 'food'),
                  ),
                  _quickAccessCard(
                    icon: Icons.fact_check_outlined,
                    title: 'Visa & Entry',
                    subtitle: 'Documents',
                    backgroundColor: lightTeal,
                    iconColor: primary,
                    onTap: () => _openScreen(context, 'visa'),
                  ),
                  _quickAccessCard(
                    icon: Icons.gavel_outlined,
                    title: 'Travel Rules',
                    subtitle: 'Local guidance',
                    backgroundColor: lightAmber,
                    iconColor: const Color(0xFFB86628),
                    onTap: () => _openScreen(context, 'rules'),
                  ),
                  _quickAccessCard(
                    icon: Icons.currency_exchange_rounded,
                    title: 'Currency',
                    subtitle: 'Money matters',
                    backgroundColor: const Color(0xFFEAF3FA),
                    iconColor: primary,
                    onTap: () => _openScreen(context, 'currency'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7F4),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFF5DDD5)),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Color(0xFFE76F51),
                      size: 19,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Before you travel, check your documents, '
                        'accommodation details and emergency contacts.',
                        style: TextStyle(
                          color: Color(0xFF7A4A3E),
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
    return SizedBox(
      width:
          (MediaQueryData.fromView(
                WidgetsBinding.instance.platformDispatcher.views.first,
              ).size.width -
              50) /
          3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 14, 8, 13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFE7ECEF)),
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
                style: const TextStyle(
                  color: textDark,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(color: textGrey, fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
