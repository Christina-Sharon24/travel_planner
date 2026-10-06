import 'package:flutter/material.dart';
import 'sos_page.dart';
import 'tripready.dart';

class SafetyPrepPage7 extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const SafetyPrepPage7({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<SafetyPrepPage7> createState() => _SafetyPrepPageState();
}

class _SafetyPrepPageState extends State<SafetyPrepPage7> {
  bool passportChecked = true;
  bool hotelChecked = true;
  bool insuranceChecked = false;
  bool chargerChecked = false;

  @override
  Widget build(BuildContext context) {
    double readiness = 0.5;
    if (passportChecked) readiness += 0.125;
    if (hotelChecked) readiness += 0.125;
    if (insuranceChecked) readiness += 0.125;
    if (chargerChecked) readiness += 0.125;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safety & Preparation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'SAFETY ALERTS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFFCDD2)),
            ),
            child: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pickpocketing Advisory',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Active bag-snatching alerts reported in crowded metro stations and transit hubs.',
                        style: TextStyle(fontSize: 12, color: Color(0xFF8E0000)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFFECB3)),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.amber, size: 30),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Common Tourist Scams',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF57F17),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Beware of fake petition signers, unofficial taxi drivers, and overpriced street vendors.',
                        style: TextStyle(fontSize: 12, color: Color(0xFF795548)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'ESSENTIAL SAFETY TIPS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
              ],
            ),
            child: const Column(
              children: [
                _TipRow('Keep digital copies of ID and passport in secure cloud storage'),
                Divider(height: 16),
                _TipRow('Use verified ridesharing apps or official transit passes'),
                Divider(height: 16),
                _TipRow('Save local emergency numbers and embassy address offline'),
                Divider(height: 16),
                _TipRow('Avoid carrying large sums of physical cash or wearing expensive jewelry'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'TRIP READINESS CHECKLIST',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
              ],
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  value: passportChecked,
                  onChanged: (val) => setState(() => passportChecked = val ?? false),
                  title: const Text('Passport & Visa checked', style: TextStyle(fontWeight: FontWeight.w500)),
                  activeColor: const Color(0xFF00796B),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  value: hotelChecked,
                  onChanged: (val) => setState(() => hotelChecked = val ?? false),
                  title: const Text('Hotel Confirmation Vouchers', style: TextStyle(fontWeight: FontWeight.w500)),
                  activeColor: const Color(0xFF00796B),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  value: insuranceChecked,
                  onChanged: (val) => setState(() => insuranceChecked = val ?? false),
                  title: const Text('International Travel Insurance', style: TextStyle(fontWeight: FontWeight.w500)),
                  activeColor: const Color(0xFF00796B),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  value: chargerChecked,
                  onChanged: (val) => setState(() => chargerChecked = val ?? false),
                  title: const Text('Universal Power Adapter', style: TextStyle(fontWeight: FontWeight.w500)),
                  activeColor: const Color(0xFF00796B),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Readiness Score', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    Text(
                      '${(readiness * 100).toInt()}%',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00796B), fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: readiness,
                    backgroundColor: Colors.grey[200],
                    color: const Color(0xFF00796B),
                    minHeight: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // SOS BUTTON -> Goes to SosPage
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SosPage()),
                );
              },
              icon: const Icon(Icons.emergency, color: Colors.white),
              label: const Text(
                'SOS / Emergency Assistance',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
                foregroundColor: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // FINISH BUTTON -> Goes to TripReadyPage
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TripReadyPage(
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
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Finish & Start Journey →',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final String text;
  const _TipRow(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF00796B), size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}