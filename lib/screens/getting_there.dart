import 'package:flutter/material.dart';

class GettingTherePage extends StatefulWidget {
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final int travellerCount;
  final double userBudget;

  const GettingTherePage({
    super.key,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<GettingTherePage> createState() => _GettingTherePageState();
}

class _GettingTherePageState extends State<GettingTherePage> {
  int selectedFlight = 0;

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  List<Map<String, dynamic>> _getFlights() {
    final destination = widget.destination;

    if (destination == 'Paris, France') {
      return [
        {
          'airline': 'Air France',
          'code': 'AF',
          'departure': '01:20',
          'arrival': '08:15',
          'duration': '10h 25m',
          'stops': '1 stop',
          'price': 42000.0,
        },
        {
          'airline': 'Emirates',
          'code': 'EK',
          'departure': '04:30',
          'arrival': '13:40',
          'duration': '12h 40m',
          'stops': '1 stop',
          'price': 46000.0,
        },
        {
          'airline': 'Qatar Airways',
          'code': 'QR',
          'departure': '03:45',
          'arrival': '14:10',
          'duration': '13h 10m',
          'stops': '1 stop',
          'price': 44000.0,
        },
      ];
    }

    if (destination == 'Dubai, UAE') {
      return [
        {
          'airline': 'Emirates',
          'code': 'EK',
          'departure': '04:30',
          'arrival': '07:20',
          'duration': '4h 20m',
          'stops': 'Non-stop',
          'price': 18000.0,
        },
        {
          'airline': 'IndiGo',
          'code': '6E',
          'departure': '21:30',
          'arrival': '00:25',
          'duration': '4h 25m',
          'stops': 'Non-stop',
          'price': 14500.0,
        },
        {
          'airline': 'Air India',
          'code': 'AI',
          'departure': '20:15',
          'arrival': '23:10',
          'duration': '4h 25m',
          'stops': 'Non-stop',
          'price': 16000.0,
        },
      ];
    }

    if (destination == 'Singapore') {
      return [
        {
          'airline': 'Singapore Airlines',
          'code': 'SQ',
          'departure': '11:45',
          'arrival': '18:35',
          'duration': '4h 20m',
          'stops': 'Non-stop',
          'price': 22000.0,
        },
        {
          'airline': 'IndiGo',
          'code': '6E',
          'departure': '23:50',
          'arrival': '06:45',
          'duration': '4h 25m',
          'stops': 'Non-stop',
          'price': 17500.0,
        },
        {
          'airline': 'Air India',
          'code': 'AI',
          'departure': '09:30',
          'arrival': '16:20',
          'duration': '4h 20m',
          'stops': 'Non-stop',
          'price': 19500.0,
        },
      ];
    }

    if (destination == 'London, UK') {
      return [
        {
          'airline': 'British Airways',
          'code': 'BA',
          'departure': '01:30',
          'arrival': '13:10',
          'duration': '11h 10m',
          'stops': 'Non-stop',
          'price': 48000.0,
        },
        {
          'airline': 'Emirates',
          'code': 'EK',
          'departure': '04:30',
          'arrival': '15:45',
          'duration': '13h 45m',
          'stops': '1 stop',
          'price': 43000.0,
        },
        {
          'airline': 'Qatar Airways',
          'code': 'QR',
          'departure': '03:45',
          'arrival': '16:20',
          'duration': '14h 05m',
          'stops': '1 stop',
          'price': 41000.0,
        },
      ];
    }

    if (destination == 'Tokyo, Japan') {
      return [
        {
          'airline': 'ANA',
          'code': 'NH',
          'departure': '00:30',
          'arrival': '18:10',
          'duration': '13h 10m',
          'stops': '1 stop',
          'price': 52000.0,
        },
        {
          'airline': 'Singapore Airlines',
          'code': 'SQ',
          'departure': '11:45',
          'arrival': '07:15',
          'duration': '12h 30m',
          'stops': '1 stop',
          'price': 48000.0,
        },
        {
          'airline': 'Air India',
          'code': 'AI',
          'departure': '21:15',
          'arrival': '19:30',
          'duration': '14h 45m',
          'stops': '1 stop',
          'price': 45000.0,
        },
      ];
    }

    if (destination == 'Bangkok, Thailand') {
      return [
        {
          'airline': 'Thai Airways',
          'code': 'TG',
          'departure': '01:10',
          'arrival': '06:35',
          'duration': '4h 55m',
          'stops': 'Non-stop',
          'price': 19000.0,
        },
        {
          'airline': 'Thai AirAsia',
          'code': 'FD',
          'departure': '23:15',
          'arrival': '04:40',
          'duration': '4h 55m',
          'stops': 'Non-stop',
          'price': 14500.0,
        },
        {
          'airline': 'IndiGo',
          'code': '6E',
          'departure': '20:40',
          'arrival': '02:05',
          'duration': '4h 55m',
          'stops': 'Non-stop',
          'price': 15500.0,
        },
      ];
    }

    if (destination == 'Rome, Italy') {
      return [
        {
          'airline': 'Qatar Airways',
          'code': 'QR',
          'departure': '03:45',
          'arrival': '14:50',
          'duration': '12h 35m',
          'stops': '1 stop',
          'price': 42000.0,
        },
        {
          'airline': 'Emirates',
          'code': 'EK',
          'departure': '04:30',
          'arrival': '15:30',
          'duration': '13h 30m',
          'stops': '1 stop',
          'price': 44000.0,
        },
        {
          'airline': 'Lufthansa',
          'code': 'LH',
          'departure': '02:20',
          'arrival': '14:10',
          'duration': '12h 20m',
          'stops': '1 stop',
          'price': 40000.0,
        },
      ];
    }

    return [
      {
        'airline': 'Emirates',
        'code': 'EK',
        'departure': '04:30',
        'arrival': '18:20',
        'duration': '19h 20m',
        'stops': '1 stop',
        'price': 55000.0,
      },
      {
        'airline': 'Qatar Airways',
        'code': 'QR',
        'departure': '03:45',
        'arrival': '17:40',
        'duration': '20h 10m',
        'stops': '1 stop',
        'price': 52000.0,
      },
      {
        'airline': 'Etihad Airways',
        'code': 'EY',
        'departure': '04:15',
        'arrival': '18:45',
        'duration': '20h 30m',
        'stops': '1 stop',
        'price': 50000.0,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final flights = _getFlights();

    final selectedPrice = flights[selectedFlight]['price'] as double;

    final totalFlightCost = selectedPrice * widget.travellerCount;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155E75),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Getting There',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Find Your Flight',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              Text(
                'Flights from Chennai to ${widget.destination}.',
                style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: const Color(0xFFD9E2E7)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.flight_takeoff_outlined,
                          color: Color(0xFF155E75),
                          size: 21,
                        ),
                        const SizedBox(width: 9),
                        const Text(
                          'Chennai',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF183B4E),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Divider(color: Color(0xFFD9E2E7)),
                          ),
                        ),
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF155E75),
                          size: 21,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            widget.destination,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF183B4E),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 13),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 18,
                          color: Color(0xFF155E75),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatDate(widget.startDate),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.people_outline,
                          size: 18,
                          color: Color(0xFF155E75),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          '${widget.travellerCount} traveller${widget.travellerCount == 1 ? '' : 's'}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              const Text(
                'Available Flights',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF183B4E),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Select a flight that works for your budget.',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),

              const SizedBox(height: 13),

              ...List.generate(flights.length, (index) {
                final flight = flights[index];
                final bool selected = selectedFlight == index;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: _flightCard(
                    flight: flight,
                    selected: selected,
                    onTap: () {
                      setState(() {
                        selectedFlight = index;
                      });
                    },
                  ),
                );
              }),

              const SizedBox(height: 7),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Flight per traveller',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        Text(
                          '₹${selectedPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF183B4E),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 9),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total for ${widget.travellerCount} traveller${widget.travellerCount == 1 ? '' : 's'}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        Text(
                          '₹${totalFlightCost.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF155E75),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              if (totalFlightCost > widget.userBudget)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        size: 20,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          'This flight costs more than your current trip budget. You may need to increase your budget.',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7A4E00),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    _showBookingMessage(
                      context,
                      flights[selectedFlight]['airline'],
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue to Booking',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(Icons.arrow_forward_rounded, size: 19),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF155E75),
                    side: const BorderSide(color: Color(0xFFD9E2E7)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
  Widget _flightCard({
    required Map<String, dynamic> flight,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: selected ? const Color(0xFF155E75) : const Color(0xFFD9E2E7),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.flight_outlined,
                    color: Color(0xFF155E75),
                    size: 21,
                  ),
                ),

                const SizedBox(width: 11),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flight['airline'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        flight['code'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  '₹${(flight['price'] as double).toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF155E75),
                  ),
                ),

                const SizedBox(width: 7),

                Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: selected
                      ? const Color(0xFF155E75)
                      : const Color(0xFF94A3B8),
                  size: 21,
                ),
              ],
            ),

            const SizedBox(height: 14),

            const Divider(color: Color(0xFFE6ECEF)),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flight['departure'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Chennai',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Text(
                      flight['duration'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Color(0xFF155E75),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      flight['stops'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        flight['arrival'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF183B4E),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        flight['code'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------------
  // BOOKING MESSAGE
  // -------------------------------------------------------------------

  void _showBookingMessage(BuildContext context, String airline) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Ready to Book?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF183B4E),
            ),
          ),
          content: Text(
            'You selected $airline for ${widget.destination}.\n\n'
            'In the full version of the app, this button can take you to a flight booking service to complete your booking.',
            style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Color(0xFF155E75)),
              ),
            ),
          ],
        );
      },
    );
  }
}
