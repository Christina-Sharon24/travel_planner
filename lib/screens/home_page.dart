import 'package:flutter/material.dart';
import 'package:travel_planner/screens/trip_config.dart';
import 'package:travel_planner/screens/trip_result.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});
  static const Color primary = Color(0xFF155E75);
  static const Color darkBlue = Color(0xFF123F50);
  static const Color teal = Color(0xFF2A9D8F);
  static const Color lightTeal = Color(0xFFE6F4F1);
  static const Color amber = Color(0xFFF4A261);
  static const Color lightAmber = Color(0xFFFFF1E7);
  static const Color background = Color(0xFFF8FAF9);
  static const Color textDark = Color(0xFF183B4E);
  static const Color textGrey = Color(0xFF64748B);
  static const Color coral = Color(0xFFE76F51);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CURRENT TRIP',
                    style: TextStyle(
                      color: textDark,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.7,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: lightAmber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit_calendar_outlined,
                          size: 13,
                          color: amber,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Planning',
                          style: TextStyle(
                            color: Color(0xFFB86628),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE7ECEF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Trip image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=900&q=80',
                            height: 155,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Positioned(
                            left: 14,
                            bottom: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.62),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Paris, France',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Paris Getaway',
                            style: TextStyle(
                              color: textDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 14,
                                color: textGrey,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '12 Oct – 16 Oct',
                                style: TextStyle(color: textGrey, fontSize: 12),
                              ),

                              const SizedBox(width: 16),

                              const Icon(
                                Icons.people_outline_rounded,
                                size: 16,
                                color: textGrey,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '2 travellers',
                                style: TextStyle(color: textGrey, fontSize: 12),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              _tripDetail(
                                Icons.account_balance_wallet_outlined,
                                '₹50,000',
                                'Budget',
                              ),

                              const SizedBox(width: 10),

                              _tripDetail(
                                Icons.schedule_rounded,
                                '17 days',
                                'To go',
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const TripResultPage7(
                                      destination: 'Paris, France',
                                      duration: '5 days',
                                      travellers: '2 travellers',
                                      userBudget: 50000,
                                      travellerCount: 2,
                                    ),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primary,
                                side: const BorderSide(color: primary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'View Trip Plan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
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

              Row(
                children: [
                  Expanded(
                    child: _quickAccessCard(
                      icon: Icons.place_outlined,
                      title: 'Places',
                      subtitle: 'Explore',
                      backgroundColor: lightTeal,
                      iconColor: primary,
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _quickAccessCard(
                      icon: Icons.cloud_outlined,
                      title: 'Weather',
                      subtitle: 'Best time',
                      backgroundColor: const Color(0xFFEAF3FA),
                      iconColor: primary,
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _quickAccessCard(
                      icon: Icons.restaurant_outlined,
                      title: 'Food',
                      subtitle: 'Local picks',
                      backgroundColor: lightAmber,
                      iconColor: const Color(0xFFB86628),
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'TRIP READINESS',
                style: TextStyle(
                  color: textDark,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE7ECEF)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You are almost ready!',
                                style: TextStyle(
                                  color: textDark,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Complete a few more preparations.',
                                style: TextStyle(color: textGrey, fontSize: 11),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: lightTeal,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '75%',
                              style: TextStyle(
                                color: primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 7,
                        backgroundColor: Color(0xFFE7EFEE),
                        valueColor: AlwaysStoppedAnimation<Color>(teal),
                      ),
                    ),

                    const SizedBox(height: 17),

                    Row(
                      children: [
                        _readinessItem(
                          icon: Icons.hotel_outlined,
                          label: 'Stay',
                          completed: true,
                        ),
                        _readinessItem(
                          icon: Icons.directions_bus_outlined,
                          label: 'Transport',
                          completed: true,
                        ),
                        _readinessItem(
                          icon: Icons.shield_outlined,
                          label: 'Safety',
                          completed: true,
                        ),
                        _readinessItem(
                          icon: Icons.backpack_outlined,
                          label: 'Packing',
                          completed: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Small safety reminder
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
                    Icon(Icons.info_outline_rounded, color: coral, size: 19),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Before you travel, check your documents, accommodation details and emergency contacts.',
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

  Widget _tripDetail(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Row(
          children: [
            Icon(icon, size: 17, color: primary),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: textDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(color: textGrey, fontSize: 9),
                ),
              ],
            ),
          ],
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
        padding: const EdgeInsets.fromLTRB(12, 14, 10, 13),
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
                fontSize: 12,
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
    );
  }

  Widget _readinessItem({
    required IconData icon,
    required String label,
    required bool completed,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: completed ? lightTeal : const Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              completed ? Icons.check_rounded : icon,
              color: completed ? teal : textGrey,
              size: 17,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            label,
            style: TextStyle(
              color: completed ? textDark : textGrey,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
