import 'package:flutter/material.dart';

import 'sos_page.dart';
import 'tripready.dart';
import 'travel_info.dart';

class SafetyPrepPage extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;
  final int travellerCount;
  final double userBudget;

  const SafetyPrepPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
    required this.travellerCount,
    required this.userBudget,
  });

  @override
  State<SafetyPrepPage> createState() => _SafetyPrepPageState();
}

class _SafetyPrepPageState extends State<SafetyPrepPage> {
  late List<String> checklist;
  late List<String> tips;

  final Color primary = const Color(0xFF6D3B47);
  final Color accent = const Color(0xFFC9826B);
  final Color background = const Color(0xFFFAF7F3);
  final Color card = const Color(0xFFFFFDFC);
  final Color textColor = const Color(0xFF292524);
  final Color secondaryText = const Color(0xFF78716C);
  final Color highlight = const Color(0xFFE8D5B5);
  final Color border = const Color(0xFFE7DFD8);

  final List<bool> _checkedItems = [false, false, false, false, false, false];

  Map<String, dynamic> getSafetyData() {
    switch (widget.destination) {
      case 'Paris, France':
        return {
          'alertTitle': 'Crowded Area Advisory',
          'alertText': 'Stay alert with your belongings in crowded tourist areas, metro stations and major attractions.',
          'tips': [
            'Keep your passport and important documents safely stored.',
            'Be careful with bags and phones in crowded tourist areas.',
            'Use official taxis or public transport when travelling around the city.',
            'Keep your emergency contacts and accommodation address available.',
          ],
          'checklist': [
            'Passport',
            'Schengen visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Emergency number: 112',
        };

      case 'Dubai, UAE':
        return {
          'alertTitle': 'Local Laws & Weather Advisory',
          'alertText': 'Respect local laws and customs and stay hydrated during hot weather.',
          'tips': [
            'Carry your passport and visa documents safely.',
            'Respect local laws, customs and public behaviour rules.',
            'Stay hydrated and protect yourself from strong heat.',
            'Keep your hotel address and emergency details available.',
          ],
          'checklist': [
            'Passport',
            'UAE visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Police: 999  •  Ambulance: 998  •  Fire: 997',
        };

      case 'Singapore':
        return {
          'alertTitle': 'Local Rules Advisory',
          'alertText': 'Follow local regulations carefully and keep important travel documents secure.',
          'tips': [
            'Keep your passport and travel documents secure.',
            'Follow local public behaviour and transport regulations.',
            'Keep your accommodation address available.',
            'Carry your travel insurance information during the trip.',
          ],
          'checklist': [
            'Passport',
            'Singapore entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Police: 999  •  Ambulance / Fire: 995',
        };

      case 'London, UK':
        return {
          'alertTitle': 'Crowded Transport Advisory',
          'alertText': 'Take care of your belongings when using busy stations, underground trains and tourist areas.',
          'tips': [
            'Keep your passport and travel documents secure.',
            'Take care of your belongings on crowded public transport.',
            'Check your UK entry and visa requirements before travelling.',
            'Keep your accommodation address available while exploring.',
          ],
          'checklist': [
            'Passport',
            'UK visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Police / Ambulance / Fire: 999 or 112',
        };

      case 'Tokyo, Japan':
        return {
          'alertTitle': 'Earthquake Preparedness',
          'alertText': 'Japan experiences earthquakes. Know your accommodation emergency procedures and follow local instructions.',
          'tips': [
            'Keep your passport and important documents secure.',
            'Learn basic earthquake safety procedures before travelling.',
            'Follow local public transport and public behaviour rules.',
            'Keep your hotel address available in case you need assistance.',
          ],
          'checklist': [
            'Passport',
            'Japan visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Emergency contact numbers',
            'Check earthquake emergency procedures',
          ],
          'emergency': 'Police: 110  •  Ambulance / Fire: 119',
        };

      case 'Bangkok, Thailand':
        return {
          'alertTitle': 'Heat & Crowded Area Advisory',
          'alertText': 'Stay hydrated in hot weather and take care of your belongings in busy markets and tourist areas.',
          'tips': [
            'Keep your passport and travel documents secure.',
            'Carry water and protect yourself from strong heat and sun.',
            'Be careful with belongings in busy markets and transport areas.',
            'Keep your hotel address and emergency contacts available.',
          ],
          'checklist': [
            'Passport',
            'Thailand visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Police: 191  •  Ambulance: 1669',
        };

      case 'Rome, Italy':
        return {
          'alertTitle': 'Crowded Tourist Area Advisory',
          'alertText': 'Stay alert with your belongings around busy tourist attractions and public transport.',
          'tips': [
            'Keep your passport and important documents safely stored.',
            'Be careful with your belongings around major tourist attractions.',
            'Keep your travel insurance information accessible.',
            'Carry your accommodation address while exploring the city.',
          ],
          'checklist': [
            'Passport',
            'Schengen visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Emergency number: 112',
        };

      case 'New York, USA':
        return {
          'alertTitle': 'City Travel Advisory',
          'alertText': 'Stay aware of your surroundings, especially in busy areas and when travelling at night.',
          'tips': [
            'Keep your passport and important documents secure.',
            'Stay aware of your surroundings in crowded areas.',
            'Use trusted transportation services.',
            'Keep your accommodation address and emergency contacts available.',
          ],
          'checklist': [
            'Passport',
            'US visa / travel authorization',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Police / Ambulance / Fire: 911',
        };

      default:
        return {
          'alertTitle': 'Travel Safety Reminder',
          'alertText': 'Keep your important documents secure and check local travel requirements before your trip.',
          'tips': [
            'Keep your passport and important documents secure.',
            'Check the entry requirements before travelling.',
            'Keep your accommodation and emergency details available.',
            'Carry your travel insurance information during your trip.',
          ],
          'checklist': [
            'Passport',
            'Visa / entry requirements',
            'Travel insurance',
            'Hotel booking confirmation',
            'Flight tickets',
            'Emergency contact numbers',
          ],
          'emergency': 'Check local emergency numbers before travelling',
        };
    }
  }

  @override
  void initState() {
    super.initState();

    final data = getSafetyData();

    checklist = List<String>.from(data['checklist']);
    tips = List<String>.from(data['tips']);
  }

  int readinessPercentage() {
    if (checklist.isEmpty) return 0;

    int completed = 0;

    for (int i = 0; i < checklist.length; i++) {
      if (_checkedItems[i]) {
        completed++;
      }
    }

    return ((completed / checklist.length) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final data = getSafetyData();

    final travelInfo = TravelInfoService.getInfo(widget.destination);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Safety & Preparation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 30),
        children: [
          // Header
          Text(
            'Prepare for ${widget.destination}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            '${widget.duration} • ${widget.travellers}',
            style: TextStyle(fontSize: 14, color: secondaryText),
          ),

          const SizedBox(height: 22),

          // Safety overview card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: border),
            ),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: highlight.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(Icons.shield_outlined, color: primary, size: 27),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Travel Safety',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Important preparation tips for your trip.',
                        style: TextStyle(fontSize: 12, color: secondaryText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Alert
          Text(
            'SAFETY ALERT',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: primary,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3ED),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: accent.withValues(alpha: 0.55)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: accent,
                    size: 23,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['alertTitle'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        data['alertText'],
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.45,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Safety tips
          Text(
            'ESSENTIAL SAFETY TIPS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: primary,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: border),
            ),
            child: Column(
              children: tips.map((tip) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: primary,
                        size: 19,
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Text(
                          tip,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 24),

          // Checklist
          Text(
            'TRIP READINESS CHECKLIST',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: primary,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: border),
            ),
            child: Column(
              children: [
                for (int i = 0; i < checklist.length; i++) ...[
                  CheckboxListTile(
                    value: _checkedItems[i],
                    onChanged: (value) {
                      setState(() {
                        _checkedItems[i] = value ?? false;
                      });
                    },
                    title: Text(
                      checklist[i],
                      style: TextStyle(fontSize: 13, color: textColor),
                    ),
                    activeColor: primary,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                  if (i != checklist.length - 1)
                    Divider(height: 1, color: border),
                ],

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Readiness Score',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                    Text(
                      '${readinessPercentage()}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: primary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 9),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: readinessPercentage() / 100,
                    minHeight: 9,
                    backgroundColor: border,
                    color: primary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Local rules reminder
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: highlight.withValues(alpha: 0.30),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: highlight.withValues(alpha: 0.8)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: primary, size: 21),
                const SizedBox(width: 11),
                Expanded(
                  child: Text(
                    'Remember to review the local rules and cultural guidance for ${travelInfo.currencyName == 'Local Currency' ? 'your destination' : widget.destination} before travelling.',
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.45,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Emergency information
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.phone_outlined, color: primary, size: 21),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency Information',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['emergency'],
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.4,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // SOS
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SosPage(
                      destination: widget.destination,
                      emergencyNumber: data['emergency'],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.emergency_outlined, color: Colors.white),
              label: const Text(
                'SOS / Emergency Assistance',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Finish
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton(
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
              style: OutlinedButton.styleFrom(
                foregroundColor: primary,
                side: BorderSide(color: primary, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Finish & Start Journey',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
