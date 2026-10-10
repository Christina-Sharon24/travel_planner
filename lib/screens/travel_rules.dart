import 'package:flutter/material.dart';
import 'package:travel_planner/screens/travel_info.dart';
import 'package:travel_planner/screens/tokyo_info.dart';

class TravelRulesPage extends StatelessWidget {
  final String destination;

  const TravelRulesPage({super.key, required this.destination});

  // App theme
  static const Color primary = Color(0xFF6D3B47);
  static const Color accent = Color(0xFFC9826B);
  static const Color background = Color(0xFFFAF7F3);
  static const Color card = Color(0xFFFFFDFC);
  static const Color text = Color(0xFF292524);
  static const Color secondaryText = Color(0xFF78716C);
  static const Color highlight = Color(0xFFE8D5B5);

  String _cleanDestination() {
    return destination.split(',').first.trim();
  }

  @override
  Widget build(BuildContext context) {

    final travelInfo = TravelInfoService.getInfo(destination);
    final country = _cleanDestination();

    final bool isTokyo =
        destination.trim() == TokyoDestinationData.destination;

    final Map<String, dynamic>? tokyoRules = isTokyo
        ? TokyoDestinationData.data['localRules'] as Map<String, dynamic>
        : null;

    final List<String> localRules = tokyoRules != null
        ? List<String>.from(tokyoRules['rules'] as List)
        : travelInfo.localRules;

    final List<String> culturalTips = tokyoRules != null
        ? List<String>.from(tokyoRules['culturalTips'] as List)
        : travelInfo.culturalTips;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        iconTheme: const IconThemeData(color: text),
        title: const Text(
          'Rules & Local Laws',
          style: TextStyle(color: text, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Know Before You Go',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: text,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Important rules, laws and customs to know while visiting $country.',
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: secondaryText,
                ),
              ),

              const SizedBox(height: 22),

              // Important notice
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: highlight.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline_rounded, color: primary, size: 24),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Rules can change. Always verify important requirements with official government or tourism sources before travelling.',
                        style: TextStyle(
                          color: text,
                          fontSize: 13.5,
                          height: 1.45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Local laws
              _sectionTitle(
                icon: Icons.gavel_rounded,
                title: 'Important Local Rules',
              ),

              const SizedBox(height: 12),
              _rulesCard(localRules),
              const SizedBox(height: 24),

              // Cultural tips
              _sectionTitle(
                icon: Icons.public_rounded,
                title: 'Cultural Etiquette',
              ),

              const SizedBox(height: 12),

              _rulesCard(culturalTips),
              const SizedBox(height: 24),

              // General things to remember
              _sectionTitle(
                icon: Icons.check_circle_outline_rounded,
                title: 'Good Practices',
              ),

              const SizedBox(height: 12),

              _generalPracticesCard(),

              const SizedBox(height: 24),

              // Verify notice
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: accent.withOpacity(0.25)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.verified_outlined,
                      color: primary,
                      size: 25,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Before you travel',
                            style: TextStyle(
                              color: text,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Check the latest official information for laws, restrictions and entry-related requirements.',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 13.5,
                              height: 1.45,
                            ),
                          ),
                        ],
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

  Widget _sectionTitle({required IconData icon, required String title}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: primary, size: 21),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: text,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _rulesCard(List<String> rules) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(rules.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == rules.length - 1 ? 0 : 15,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    rules[index],
                    style: const TextStyle(
                      color: text,
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _generalPracticesCard() {
    const practices = [
      'Keep important travel documents secure.',
      'Follow instructions given by local authorities.',
      'Respect public spaces and other travellers.',
      'Check restrictions before carrying unfamiliar items.',
      'Be careful when taking photographs in sensitive locations.',
    ];

    return _rulesCard(practices);
  }
}
