import 'package:flutter/material.dart';
import 'package:travel_planner/screens/travel_info.dart';
import 'package:travel_planner/screens/tokyo_info.dart';
import 'package:url_launcher/url_launcher.dart';

class VisaEntryPage extends StatelessWidget {
  final String destination;

  const VisaEntryPage({super.key, required this.destination});

  static const Color burgundy = Color(0xFF6D3B47);
  static const Color terracotta = Color(0xFFC9826B);
  static const Color ivory = Color(0xFFFAF7F3);
  static const Color cream = Color(0xFFFFFDFC);
  static const Color champagne = Color(0xFFE8D5B5);
  static const Color charcoal = Color(0xFF292524);
  static const Color warmGrey = Color(0xFF78716C);

  String _cleanDestination() {
    return destination.split(',').first.trim();
  }

  Future<void> _openOfficialRequirements(BuildContext context) async {
    final bool isTokyo = destination.trim() == TokyoDestinationData.destination;

    if (!isTokyo) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please visit the official government or embassy website '
            'for your destination.',
          ),
        ),
      );
      return;
    }

    final Uri officialUrl = Uri.parse(
      'https://www.mofa.go.jp/j_info/visit/visa/',
    );

    try {
      final bool launched = await launchUrl(
        officialUrl,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the official website.')),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the official website.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final travelInfo = TravelInfoService.getInfo(destination);
    final country = _cleanDestination();

    final bool isTokyo = destination.trim() == TokyoDestinationData.destination;

    final Map<String, dynamic>? tokyoVisa = isTokyo
        ? TokyoDestinationData.data['visaEntry'] as Map<String, dynamic>
        : null;

    final String visaSummary =
        tokyoVisa?['summary'] as String? ?? travelInfo.visaSummary;

    final List<String> visaDocuments = tokyoVisa != null
        ? List<String>.from(tokyoVisa['checklist'] as List)
        : travelInfo.visaDocuments;

    return Scaffold(
      backgroundColor: ivory,
      appBar: AppBar(
        backgroundColor: ivory,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: charcoal,
        title: const Text(
          'Visa & Entry',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: charcoal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [burgundy, Color(0xFF83505B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: burgundy.withOpacity(0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.flight_land_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ENTRY GUIDE',
                          style: TextStyle(
                            color: champagne,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          country,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Know what you need before you go',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Before You Travel',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: charcoal,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'A quick checklist to help you prepare for entry.',
              style: TextStyle(color: warmGrey, fontSize: 14, height: 1.4),
            ),

            const SizedBox(height: 18),

            _infoCard(
              icon: Icons.airplane_ticket_outlined,
              title: 'Visa Requirement',
              description: visaSummary,
            ),

            _infoCard(
              icon: Icons.badge_outlined,
              title: 'Passport Validity',
              description: travelInfo.passportValidity,
            ),

            _documentsCard(visaDocuments),

            _infoCard(
              icon: Icons.fact_check_outlined,
              title: 'Entry Requirements',
              description: isTokyo
                  ? 'Check Japan’s current entry procedures, visa eligibility '
                        'for your passport, customs rules and any required arrival '
                        'declarations. Requirements depend on your nationality '
                        'and travel circumstances.'
                  : 'Some destinations may require immigration forms, travel '
                        'authorizations, health documents or other declarations. '
                        'Check the current requirements before departure.',
            ),

            _infoCard(
              icon: Icons.update_rounded,
              title: 'Check Before Departure',
              description:
                  'Entry rules can change. Recheck the latest requirements '
                  'before travelling, especially close to your departure date.',
            ),

            const SizedBox(height: 8),

            // Important notice
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF4EBDD),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: champagne, width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: terracotta.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.priority_high_rounded,
                      color: terracotta,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Important',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: charcoal,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Visa and entry rules vary by passport and can '
                          'change over time. Always verify the latest '
                          'information with the destination country’s official '
                          'immigration or embassy website.',
                          style: TextStyle(
                            fontSize: 13,
                            color: warmGrey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Official verification card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDE5DF)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.035),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: burgundy.withOpacity(0.09),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.verified_outlined,
                          color: burgundy,
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Verify Official Information',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: charcoal,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 13),

                  Text(
                    'Before travelling to $country, verify the latest visa '
                    'and entry information through an official government '
                    'or embassy source.',
                    style: const TextStyle(
                      color: warmGrey,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 17),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () => _openOfficialRequirements(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: burgundy,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      icon: const Icon(Icons.open_in_new_rounded, size: 18),
                      label: const Text(
                        'Check Official Requirements',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shield_outlined,
                    size: 15,
                    color: burgundy.withOpacity(0.7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Travel prepared with SafeTrail',
                    style: TextStyle(
                      color: warmGrey.withOpacity(0.85),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _documentsCard(List<String> documents) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDE5DF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: burgundy.withOpacity(0.08),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.folder_open_outlined,
              color: burgundy,
              size: 23,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Required Documents',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                    color: charcoal,
                  ),
                ),
                const SizedBox(height: 8),
                ...documents.map(
                  (document) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(
                            color: terracotta,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            document,
                            style: const TextStyle(
                              fontSize: 13,
                              color: warmGrey,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDE5DF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: burgundy.withOpacity(0.08),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: burgundy, size: 23),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                    color: charcoal,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: warmGrey,
                    height: 1.5,
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
