import 'package:flutter/material.dart';
import 'package:travel_planner/screens/travel_info.dart';
import 'package:travel_planner/screens/tokyo_info.dart';

class CurrencyPage extends StatelessWidget {
  final String destination;

  const CurrencyPage({super.key, required this.destination});

  // SafeTrail elegant theme
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

  @override
  Widget build(BuildContext context) {

    final place = _cleanDestination();

    final travelInfo = TravelInfoService.getInfo(destination);

    final bool isTokyo =
        destination.trim() == TokyoDestinationData.destination;

    final Map<String, dynamic>? tokyoCurrency = isTokyo
        ? TokyoDestinationData.data['currency'] as Map<String, dynamic>
        : null;

    final String currencyName =
        tokyoCurrency?['name'] as String? ?? travelInfo.currencyName;

    final String currencyCode =
        tokyoCurrency?['code'] as String? ?? travelInfo.currencyCode;

    final String currencySymbol =
        tokyoCurrency?['symbol'] as String? ?? travelInfo.currencySymbol;

    final List<String> moneyTips = tokyoCurrency != null
        ? List<String>.from(tokyoCurrency['tips'] as List)
        : [
      'Carry a backup payment method.',
      'Check foreign transaction fees with your bank.',
      'Use reputable ATMs or authorised currency exchange services.',
      'Keep some local cash for places that do not accept cards.',
    ];

    return Scaffold(
      backgroundColor: ivory,
      appBar: AppBar(
        backgroundColor: ivory,
        foregroundColor: charcoal,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Currency',
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
            // Header
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
                      Icons.currency_exchange_rounded,
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
                          'MONEY GUIDE',
                          style: TextStyle(
                            color: champagne,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          place,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Know the local currency before you go',
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
              'Local Currency',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: charcoal,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Here is the currency commonly used at your destination.',
              style: TextStyle(color: warmGrey, fontSize: 14, height: 1.4),
            ),

            const SizedBox(height: 18),

            // Currency card
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
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: terracotta.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.payments_outlined,
                      color: terracotta,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currencyName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: charcoal,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                            'Currency code: $currencyCode',
                            style: const TextStyle(color: warmGrey, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    currencySymbol,
                    style: const TextStyle(
                      color: burgundy,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Money Tips',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: charcoal,
              ),
            ),

            const SizedBox(height: 15),
            ...moneyTips.map(
                  (tip) => _tipCard(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Money Tip',
                description: tip,
              ),
            ),
            const SizedBox(height: 10),

            // Exchange rate section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(19),
              decoration: BoxDecoration(
                color: const Color(0xFFF4EBDD),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: champagne),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: burgundy.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline_rounded,
                      color: burgundy,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Exchange Rates Change',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: charcoal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          tokyoCurrency?['converterNotice'] as String? ??
                              'Exchange rates change throughout the day. Always check the latest rate before exchanging money or making a large payment.',
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
            ),

            const SizedBox(height: 24),

            // Converter placeholder
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
                          Icons.calculate_outlined,
                          color: burgundy,
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Currency Converter',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: charcoal,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'A live currency converter can be connected here to show the latest exchange rate.',
                    style: TextStyle(
                      color: warmGrey,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Live currency conversion will be connected here.',
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: burgundy,
                        side: const BorderSide(color: burgundy),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      icon: const Icon(Icons.swap_horiz_rounded, size: 20),
                      label: const Text(
                        'Open Converter',
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

  Widget _tipCard({
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
              color: terracotta.withOpacity(0.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: terracotta, size: 23),
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
