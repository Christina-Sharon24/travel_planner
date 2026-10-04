import 'package:flutter/material.dart';
import 'trip_plan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool desktop = width >= 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // TOP HEADER
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: desktop ? 70 : 25,
                  vertical: desktop ? 35 : 25,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF007F7F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travel Planner',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: desktop ? 32 : 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Plan your trip. Travel safely.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: desktop ? 18 : 14,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),

              // MAIN CONTENT
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: desktop ? 70 : 25,
                  vertical: 35,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'Plan your next adventure',
                      style: TextStyle(
                        fontSize: desktop ? 30 : 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // PLAN NEW TRIP BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: desktop ? 75 : 60,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const TripPlanPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: Text(
                          'Plan a New Trip',
                          style: TextStyle(
                            fontSize: desktop ? 19 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF007F7F),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    Text(
                      'Upcoming Trip',
                      style: TextStyle(
                        fontSize: desktop ? 28 : 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // PARIS TRIP CARD
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [

                          // PARIS IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=600&q=80',
                              width: desktop ? 190 : 100,
                              height: desktop ? 140 : 100,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 22),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paris, France',
                                  style: TextStyle(
                                    fontSize: desktop ? 28 : 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  '5 Days • 2 Travellers',
                                  style: TextStyle(
                                    fontSize: desktop ? 18 : 14,
                                    color: Colors.grey[700],
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  'Couple Trip',
                                  style: TextStyle(
                                    fontSize: desktop ? 17 : 14,
                                    color: const Color(0xFF007F7F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (desktop)
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF007F7F),
                              size: 22,
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // BUDGET + DAYS LEFT
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth >= 650) {
                          return Row(
                            children: [
                              Expanded(
                                child: _infoCard(
                                  'Budget',
                                  'Rs 50,000',
                                  Icons.account_balance_wallet,
                                  desktop,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _infoCard(
                                  'Days Left',
                                  '25 Days',
                                  Icons.calendar_month,
                                  desktop,
                                ),
                              ),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            _infoCard(
                              'Budget',
                              'Rs 50,000',
                              Icons.account_balance_wallet,
                              desktop,
                            ),
                            const SizedBox(height: 15),
                            _infoCard(
                              'Days Left',
                              '25 Days',
                              Icons.calendar_month,
                              desktop,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),

              // BOTTOM NAVIGATION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: const [
                    _BottomItem(
                      Icons.home,
                      'Home',
                    ),
                    _BottomItem(
                      Icons.map,
                      'Trips',
                    ),
                    _BottomItem(
                      Icons.shield,
                      'Safety',
                    ),
                    _BottomItem(
                      Icons.person,
                      'Profile',
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

  Widget _infoCard(
      String title,
      String value,
      IconData icon,
      bool desktop,
      ) {
    return Container(
      padding: EdgeInsets.all(desktop ? 25 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF007F7F),
            size: desktop ? 35 : 28,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: desktop ? 17 : 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: desktop ? 22 : 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BottomItem(
      this.icon,
      this.text,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: const Color(0xFF007F7F),
        ),
        const SizedBox(height: 5),
        Text(text),
      ],
    );
  }
}