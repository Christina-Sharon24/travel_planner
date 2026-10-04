import 'package:flutter/material.dart';
import 'trip_details_page.dart';

class SafetyPage extends StatelessWidget {
  final String destination;
  final String travelType;
  final String duration;
  final String travellers;
  final String budget;

  const SafetyPage({
    super.key,
    required this.destination,
    required this.travelType,
    required this.duration,
    required this.travellers,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final fontSize = width < 600 ? 14.0 : 18.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F7),
      appBar: AppBar(
        title: const Text('Safety Information'),
        backgroundColor: const Color(0xFF007F7F),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width < 600 ? 20 : 70,
            vertical: 30,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _warningBox(
                    'Reported Concerns',
                    'Be aware of crowded tourist areas and keep your belongings safe.',
                    Icons.warning_amber,
                    fontSize,
                  ),

                  const SizedBox(height: 15),

                  _warningBox(
                    'Tourist Scams',
                    'Avoid unofficial guides and verify prices before making payments.',
                    Icons.report_problem,
                    fontSize,
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'SAFETY TIPS',
                    style: TextStyle(
                      fontSize: width < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _tip('Keep emergency contacts saved.', fontSize),
                        _tip('Carry a copy of important documents.', fontSize),
                        _tip('Avoid isolated areas at night.', fontSize),
                        _tip('Keep your phone charged.', fontSize),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'BEFORE YOU LEAVE',
                    style: TextStyle(
                      fontSize: width < 600 ? 22 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _checkItem('Passport and documents'),
                  _checkItem('Emergency contacts'),
                  _checkItem('Travel insurance'),
                  _checkItem('Local emergency numbers'),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2F2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.verified,
                          color: Color(0xFF007F7F),
                          size: 40,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Trip Readiness',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Your trip is ready to start.',
                                style: TextStyle(fontSize: fontSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.sos),
                          label: const Text('SOS / Emergency Help'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TripDetailsPage(
                              destination: destination,
                              travelType: travelType,
                              duration: duration,
                              travellers: travellers,
                              budget: budget,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007F7F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Start Trip',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _warningBox(
      String title,
      String text,
      IconData icon,
      double fontSize,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.orange,
            size: 35,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize + 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tip(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF007F7F),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkItem(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF007F7F),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}