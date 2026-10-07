import 'package:flutter/material.dart';

import 'sos_page.dart';
import 'tripready.dart';

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

  Map<String, dynamic> getSafetyData() {
    if (widget.destination == 'Paris, France') {
      return {
        'alertTitle': 'Crowded Area Advisory',
        'alertText': 'Stay alert with your belongings in crowded tourist areas, metro stations and major attractions.',
        'alertColor': const Color(0xFFE76F51),
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
    }

    if (widget.destination == 'Dubai, UAE') {
      return {
        'alertTitle': 'Local Laws & Weather Advisory',
        'alertText': 'Respect local laws and customs and stay hydrated during hot weather.',
        'alertColor': const Color(0xFFF4A261),
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
    }

    if (widget.destination == 'Singapore') {
      return {
        'alertTitle': 'Local Rules Advisory',
        'alertText': 'Follow local regulations carefully and keep important travel documents secure.',
        'alertColor': const Color(0xFFF4A261),
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
    }

    if (widget.destination == 'London, UK') {
      return {
        'alertTitle': 'Crowded Transport Advisory',
        'alertText': 'Take care of your belongings when using busy stations, underground trains and tourist areas.',
        'alertColor': const Color(0xFFE76F51),
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
    }

    if (widget.destination == 'Tokyo, Japan') {
      return {
        'alertTitle': 'Earthquake Preparedness',
        'alertText': 'Japan experiences earthquakes. Know your accommodation emergency procedures and follow local instructions.',
        'alertColor': const Color(0xFFE76F51),
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
    }

    if (widget.destination == 'Bangkok, Thailand') {
      return {
        'alertTitle': 'Heat & Crowded Area Advisory',
        'alertText': 'Stay hydrated in hot weather and take care of your belongings in busy markets and tourist areas.',
        'alertColor': const Color(0xFFF4A261),
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
    }

    if (widget.destination == 'Rome, Italy') {
      return {
        'alertTitle': 'Crowded Tourist Area Advisory',
        'alertText': 'Stay alert with your belongings around busy tourist attractions and public transport.',
        'alertColor': const Color(0xFFE76F51),
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
    }

    return {
      'alertTitle': 'Travel Safety Reminder',
      'alertText': 'Keep your important documents secure and check local travel requirements before your trip.',
      'alertColor': const Color(0xFFF4A261),
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

  @override
  void initState() {
    super.initState();

    final data = getSafetyData();

    checklist = List<String>.from(data['checklist']);
    tips = List<String>.from(data['tips']);
  }

  @override
  Widget build(BuildContext context) {
    final data = getSafetyData();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text(
          'Safety & Preparation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF155E75),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            'Prepare for ${widget.destination}',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Color(0xFF183B4E),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            '${widget.duration} • ${widget.travellers}',
            style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),

          const SizedBox(height: 23),

          const Text(
            'SAFETY ALERT',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: data['alertColor'] == const Color(0xFFE76F51)
                  ? const Color(0xFFFFF0ED)
                  : const Color(0xFFFFF4E8),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: data['alertColor']),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: data['alertColor'],
                  size: 25,
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['alertTitle'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: data['alertColor'],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data['alertText'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'ESSENTIAL SAFETY TIPS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: const Color(0xFFD9E2E7)),
            ),
            child: Column(
              children: tips.map((tip) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF2A9D8F),
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          tip,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF183B4E),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'TRIP READINESS CHECKLIST',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF155E75),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: const Color(0xFFD9E2E7)),
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
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF183B4E),
                      ),
                    ),
                    activeColor: const Color(0xFF155E75),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                  if (i != checklist.length - 1)
                    const Divider(height: 1, color: Color(0xFFE6ECEF)),
                ],

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Readiness Score',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF183B4E),
                      ),
                    ),
                    Text(
                      '${readinessPercentage()}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF155E75),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: readinessPercentage() / 100,
                    backgroundColor: const Color(0xFFE6ECEF),
                    color: const Color(0xFF2A9D8F),
                    minHeight: 9,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4F1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.phone_outlined,
                  size: 20,
                  color: Color(0xFF155E75),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    data['emergency'],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF183B4E),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 23),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SosPage(destination: '', emergencyNumber: '',)),
                );
              },
              icon: const Icon(Icons.emergency, color: Colors.white),
              label: const Text(
                'SOS / Emergency Assistance',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE76F51),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 52,
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
                backgroundColor: const Color(0xFF155E75),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Finish & Start Journey',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  final List<bool> _checkedItems = [false, false, false, false, false, false];

  int readinessPercentage() {
    int completed = 0;

    for (bool item in _checkedItems) {
      if (item) {
        completed++;
      }
    }

    return ((completed / _checkedItems.length) * 100).toInt();
  }
}
