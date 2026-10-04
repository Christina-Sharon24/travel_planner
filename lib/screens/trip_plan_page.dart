import 'package:flutter/material.dart';
import 'safety_page.dart';

class TripPlanPage extends StatefulWidget {
  const TripPlanPage({super.key});

  @override
  State<TripPlanPage> createState() => _TripPlanPageState();
}

class _TripPlanPageState extends State<TripPlanPage> {
  String destination = 'Paris, France';
  String travelType = 'Couple';

  int days = 5;
  int travellers = 2;

  final List<String> destinations = [
    'Paris, France',
    'London, UK',
    'Dubai, UAE',
    'Tokyo, Japan',
    'Singapore',
    'New York, USA',
    'Rome, Italy',
    'Switzerland',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double fontSize = width < 600 ? 15 : 19;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F7),
      appBar: AppBar(
        title: const Text(
          'Plan Your Trip',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                  Text(
                    'Where do you want to go?',
                    style: TextStyle(
                      fontSize: width < 600 ? 21 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: DropdownButton<String>(
                      value: destination,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: destinations.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: fontSize),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            destination = value;
                          });
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Who are you travelling with?',
                    style: TextStyle(
                      fontSize: width < 600 ? 21 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          _travelButton('Solo', Icons.person),
                          _travelButton('Couple', Icons.favorite),
                          _travelButton('Family', Icons.family_restroom),
                          _travelButton('Friends', Icons.groups),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 700) {
                        return Row(
                          children: [
                            Expanded(
                              child: _counterCard(
                                'Number of Days',
                                days,
                                    () {
                                  if (days > 1) {
                                    setState(() => days--);
                                  }
                                },
                                    () {
                                  setState(() => days++);
                                },
                                fontSize,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _counterCard(
                                'Travellers',
                                travellers,
                                    () {
                                  if (travellers > 1) {
                                    setState(() => travellers--);
                                  }
                                },
                                    () {
                                  setState(() => travellers++);
                                },
                                fontSize,
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          _counterCard(
                            'Number of Days',
                            days,
                                () {
                              if (days > 1) {
                                setState(() => days--);
                              }
                            },
                                () {
                              setState(() => days++);
                            },
                            fontSize,
                          ),
                          const SizedBox(height: 20),
                          _counterCard(
                            'Travellers',
                            travellers,
                                () {
                              if (travellers > 1) {
                                setState(() => travellers--);
                              }
                            },
                                () {
                              setState(() => travellers++);
                            },
                            fontSize,
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_balance_wallet,
                          color: Color(0xFF007F7F),
                          size: 35,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated Budget',
                              style: TextStyle(
                                fontSize: fontSize - 2,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Rs 50,000',
                              style: TextStyle(
                                fontSize: fontSize + 6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SafetyPage(
                              destination: destination,
                              travelType: travelType,
                              duration: '$days days',
                              travellers: '$travellers travellers',
                              budget: 'Rs 50,000',
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
                        'Continue',
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

  Widget _travelButton(String name, IconData icon) {
    final selected = travelType == name;

    return SizedBox(
      width: 250,
      child: OutlinedButton.icon(
        onPressed: () {
          setState(() {
            travelType = name;
          });
        },
        icon: Icon(
          icon,
          color: selected ? Colors.white : const Color(0xFF007F7F),
        ),
        label: Text(name),
        style: OutlinedButton.styleFrom(
          backgroundColor:
          selected ? const Color(0xFF007F7F) : Colors.white,
          foregroundColor:
          selected ? Colors.white : const Color(0xFF007F7F),
          padding: const EdgeInsets.symmetric(vertical: 20),
          side: const BorderSide(color: Color(0xFF007F7F)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget _counterCard(
      String title,
      int value,
      VoidCallback minus,
      VoidCallback plus,
      double fontSize,
      ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: minus,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: fontSize + 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: plus,
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}