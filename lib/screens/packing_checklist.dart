import 'package:flutter/material.dart';

class PackingChecklistPage extends StatefulWidget {
  final String destination;
  final String duration;
  final String travellers;

  const PackingChecklistPage({
    super.key,
    required this.destination,
    required this.duration,
    required this.travellers,
  });

  @override
  State<PackingChecklistPage> createState() => _PackingChecklistPageState();
}

class _PackingChecklistPageState extends State<PackingChecklistPage> {
  final Color primary = const Color(0xFF6D3B47);
  final Color accent = const Color(0xFFC9826B);
  final Color background = const Color(0xFFFAF7F3);
  final Color card = const Color(0xFFFFFDFC);
  final Color textColor = const Color(0xFF292524);
  final Color secondaryText = const Color(0xFF78716C);
  final Color highlight = const Color(0xFFE8D5B5);
  final Color border = const Color(0xFFE7DFD8);

  final Map<String, bool> checkedItems = {};

  final Map<String, List<String>> packingData = {
    'Documents': [
      'Passport',
      'Visa / entry documents',
      'Flight tickets',
      'Hotel booking confirmation',
      'Travel insurance',
      'Emergency contact details',
    ],
    'Clothing': [
      'Comfortable everyday clothes',
      'Underwear and socks',
      'Comfortable walking shoes',
      'Sleepwear',
      'Light jacket or outerwear',
    ],
    'Essentials': [
      'Mobile phone',
      'Phone charger',
      'Power bank',
      'Travel adapter',
      'Personal toiletries',
      'Medications / personal items',
    ],
    'Travel Safety': [
      'Copies of important documents',
      'Small first-aid kit',
      'Emergency contact information',
      'Secure travel wallet',
    ],
  };

  List<String> getWeatherItems() {
    switch (widget.destination) {
      case 'Dubai, UAE':
      case 'Bangkok, Thailand':
        return [
          'Sunglasses',
          'Sun protection',
          'Lightweight clothing',
          'Reusable water bottle',
        ];

      case 'Tokyo, Japan':
        return [
          'Comfortable walking shoes',
          'Light jacket',
          'Compact umbrella',
        ];

      case 'London, UK':
      case 'Paris, France':
      case 'Rome, Italy':
        return [
          'Light jacket',
          'Compact umbrella',
          'Comfortable walking shoes',
        ];

      case 'Singapore':
        return [
          'Lightweight clothing',
          'Compact umbrella',
          'Comfortable walking shoes',
        ];

      case 'New York, USA':
        return [
          'Comfortable walking shoes',
          'Light jacket',
          'Weather-appropriate clothing',
        ];

      default:
        return ['Weather-appropriate clothing', 'Comfortable walking shoes'];
    }
  }

  List<String> allItems() {
    final items = <String>[];

    for (final list in packingData.values) {
      items.addAll(list);
    }

    items.addAll(getWeatherItems());

    return items;
  }

  int get completedCount {
    return allItems().where((item) => checkedItems[item] == true).length;
  }

  int get totalCount => allItems().length;

  int get progressPercentage {
    if (totalCount == 0) return 0;
    return ((completedCount / totalCount) * 100).toInt();
  }

  Widget sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: highlight.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: primary, size: 20),
          ),
          const SizedBox(width: 11),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget checklistCard(List<String> items) {
    return Container(
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            CheckboxListTile(
              value: checkedItems[items[i]] ?? false,
              onChanged: (value) {
                setState(() {
                  checkedItems[items[i]] = value ?? false;
                });
              },
              activeColor: primary,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              dense: true,
              title: Text(
                items[i],
                style: TextStyle(fontSize: 13, color: textColor),
              ),
            ),
            if (i != items.length - 1) Divider(height: 1, color: border),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherItems = getWeatherItems();

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Packing Checklist',
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
          Text(
            'Pack for ${widget.destination}',
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

          // Progress card
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: border),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: primary.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        Icons.luggage_outlined,
                        color: primary,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Packing Progress',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$completedCount of $totalCount items packed',
                            style: TextStyle(
                              fontSize: 12,
                              color: secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '$progressPercentage%',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: primary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 13),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progressPercentage / 100,
                    minHeight: 9,
                    backgroundColor: border,
                    color: primary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Documents
          sectionTitle('Documents', Icons.description_outlined),
          checklistCard(packingData['Documents']!),

          const SizedBox(height: 22),

          // Clothing
          sectionTitle('Clothing', Icons.checkroom_outlined),
          checklistCard(packingData['Clothing']!),

          const SizedBox(height: 22),

          // Essentials
          sectionTitle('Essentials', Icons.backpack_outlined),
          checklistCard(packingData['Essentials']!),

          const SizedBox(height: 22),

          // Safety
          sectionTitle('Travel Safety', Icons.shield_outlined),
          checklistCard(packingData['Travel Safety']!),

          const SizedBox(height: 22),

          // Weather
          sectionTitle('Weather Preparation', Icons.wb_sunny_outlined),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: highlight.withValues(alpha: 0.28),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: highlight.withValues(alpha: 0.85)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.cloud_outlined, color: primary, size: 22),
                const SizedBox(width: 11),
                Expanded(
                  child: Text(
                    'These items are suggested based on typical conditions for ${widget.destination}. The weather section will later use live forecast data to make this list more accurate.',
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

          const SizedBox(height: 12),

          checklistCard(weatherItems),

          const SizedBox(height: 22),

          // Important reminder
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
                Icon(Icons.info_outline, color: accent, size: 21),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Pack according to your actual travel dates and check the weather forecast before leaving.',
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.45,
                      color: secondaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  for (final item in allItems()) {
                    checkedItems[item] = true;
                  }
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: primary,
                side: BorderSide(color: primary, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Mark All as Packed',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Back to Your Trip',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
