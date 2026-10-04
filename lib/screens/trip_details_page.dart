import 'package:flutter/material.dart';
import 'sos_page.dart';

class TripDetailsPage extends StatelessWidget {
  final String destination;
  final String travelType;
  final String duration;
  final String travellers;
  final String budget;

  const TripDetailsPage({
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
    final bool desktop = width >= 800;

    final double headingSize = desktop ? 30 : 23;
    final double normalSize = desktop ? 18 : 15;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F7),
      appBar: AppBar(
        title: const Text(
          'Trip Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF007F7F),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: desktop ? 70 : 20,
            vertical: 30,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=1200&q=85',
                      width: double.infinity,
                      height: desktop ? 360 : 220,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: desktop ? 360 : 220,
                          color: const Color(0xFFD9EEEE),
                          child: const Center(
                            child: Icon(
                              Icons.location_city,
                              size: 80,
                              color: Color(0xFF007F7F),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    destination,
                    style: TextStyle(
                      fontSize: desktop ? 38 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      _informationBox(
                        Icons.calendar_month,
                        duration,
                        normalSize,
                      ),
                      _informationBox(
                        Icons.people,
                        travellers,
                        normalSize,
                      ),
                      _informationBox(
                        Icons.favorite,
                        travelType,
                        normalSize,
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Best Time to Visit',
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _timePill('Spring'),
                      _timePill('Summer'),
                      _timePill('Autumn'),
                      _timePill('Winter'),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Estimated Total Cost',
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      desktop ? 30 : 22,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _costRow(
                          Icons.flight,
                          'Flights',
                          'Rs 25,000',
                          normalSize,
                        ),
                        _costRow(
                          Icons.hotel,
                          'Accommodation',
                          'Rs 15,000',
                          normalSize,
                        ),
                        _costRow(
                          Icons.restaurant,
                          'Food',
                          'Rs 5,000',
                          normalSize,
                        ),
                        _costRow(
                          Icons.directions_car,
                          'Transport',
                          'Rs 5,000',
                          normalSize,
                        ),
                        const Divider(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: desktop ? 22 : 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              budget,
                              style: TextStyle(
                                fontSize: desktop ? 25 : 21,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF007F7F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Your Itinerary',
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _dayCard(
                    'Day 1',
                    'Arrival & City Exploration',
                    'Arrive in Paris and explore the city.',
                    Icons.flight_land,
                    normalSize,
                  ),
                  const SizedBox(height: 15),
                  _dayCard(
                    'Day 2',
                    'Explore Popular Attractions',
                    'Visit famous attractions and enjoy the city.',
                    Icons.place,
                    normalSize,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shield,
                      ),
                      label: const Text(
                        'Safety & Preparation',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                        const Color(0xFF007F7F),
                        side: const BorderSide(
                          color: Color(0xFF007F7F),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const SosPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                      ),
                      label: const Text(
                        'Start Trip',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFF007F7F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _informationBox(
      IconData icon,
      String text,
      double fontSize,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2F2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFF007F7F),
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize - 2,
              color: const Color(0xFF007F7F),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timePill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFF007F7F),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF007F7F),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _costRow(
      IconData icon,
      String title,
      String amount,
      double fontSize,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF007F7F),
            size: 28,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dayCard(
      String day,
      String title,
      String description,
      IconData icon,
      double fontSize,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFE3F2F2),
            child: Icon(
              icon,
              color: const Color(0xFF007F7F),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: fontSize - 2,
                    color: const Color(0xFF007F7F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: fontSize - 2,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}