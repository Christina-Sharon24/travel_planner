import 'package:flutter/material.dart';
import 'package:travel_planner/screens/accomodation.dart';

class GettingAroundPage4 extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const GettingAroundPage4({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<GettingAroundPage4> createState() => _GettingAroundPage4State();
}

class _GettingAroundPage4State extends State<GettingAroundPage4> {
  String airportOption = 'Metro';
  String cityOption = 'Metro Pass';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getting Around', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transit Options in ${widget.destination}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF004D40))),
            const SizedBox(height: 20),
            const Text('AIRPORT → HOTEL',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 10),
            // Airport Options
            GestureDetector(
              onTap: () => setState(() => airportOption = 'Metro'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: airportOption == 'Metro' ? const Color(0xFF00796B) : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: const Color(0xFFE0F2F1), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.train, color: Color(0xFF00796B)),
                        ),
                        const SizedBox(width: 14),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Metro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 4),
                            Text('Fast • Budget friendly',
                                style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('₹180',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00796B),
                                fontSize: 16)),
                        const SizedBox(width: 10),
                        Icon(Icons.check_circle,
                            color: airportOption == 'Metro' ? const Color(0xFF00796B) : Colors.grey.shade300),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => airportOption = 'Taxi'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: airportOption == 'Taxi' ? const Color(0xFF00796B) : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: const Color(0xFFE0F2F1), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.local_taxi, color: Color(0xFF00796B)),
                        ),
                        const SizedBox(width: 14),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Taxi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 4),
                            Text('Direct • More convenient',
                                style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('₹1,200',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00796B),
                                fontSize: 16)),
                        const SizedBox(width: 10),
                        Icon(Icons.check_circle,
                            color: airportOption == 'Taxi' ? const Color(0xFF00796B) : Colors.grey.shade300),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text('AROUND THE CITY',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B))),
            const SizedBox(height: 10),
            // City Options
            GestureDetector(
              onTap: () => setState(() => cityOption = 'Metro Pass'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: cityOption == 'Metro Pass' ? const Color(0xFF00796B) : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: const Color(0xFFE0F2F1), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.confirmation_number, color: Color(0xFF00796B)),
                        ),
                        const SizedBox(width: 14),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Metro Pass',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 4),
                            Text('5 - Day unlimited travel',
                                style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('₹1,500',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00796B),
                                fontSize: 16)),
                        const SizedBox(width: 10),
                        Icon(Icons.check_circle,
                            color: cityOption == 'Metro Pass' ? const Color(0xFF00796B) : Colors.grey.shade300),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => cityOption = 'Bus'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: cityOption == 'Bus' ? const Color(0xFF00796B) : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: const Color(0xFFE0F2F1), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.directions_bus, color: Color(0xFF00796B)),
                        ),
                        const SizedBox(width: 14),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bus',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 4),
                            Text('Scenic • Budget option',
                                style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('₹900',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00796B),
                                fontSize: 16)),
                        const SizedBox(width: 10),
                        Icon(Icons.check_circle,
                            color: cityOption == 'Bus' ? const Color(0xFF00796B) : Colors.grey.shade300),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StaySuggestionsPage5(
                        destination: widget.destination,
                        duration: widget.duration,
                        travellers: widget.travellers,
                        travellerCount: widget.travellerCount,
                        userBudget: widget.userBudget,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                child: const Text('Choose Stay Suggestions →',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}