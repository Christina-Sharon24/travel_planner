class TravelInfo {
  final String currencyName;
  final String currencyCode;
  final String currencySymbol;

  final String visaSummary;
  final String passportValidity;
  final List<String> visaDocuments;

  final List<String> localRules;
  final List<String> culturalTips;

  TravelInfo({
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
    required this.visaSummary,
    required this.passportValidity,
    required this.visaDocuments,
    required this.localRules,
    required this.culturalTips,
  });
}

class TravelInfoService {
  static final Map<String, TravelInfo> _destinationInfo = {
    'Paris, France': TravelInfo(
      currencyName: 'Euro',
      currencyCode: 'EUR',
      currencySymbol: '€',
      visaSummary:
          'Check the latest Schengen visa requirements before travelling.',
      passportValidity: 'Check that your passport meets the validity requirements for your trip.',
      visaDocuments: [
        'Valid passport',
        'Visa application documents',
        'Travel itinerary',
        'Accommodation details',
        'Travel insurance',
        'Proof of sufficient funds',
      ],
      localRules: [
        'Carry required identification documents.',
        'Follow local public transport rules.',
        'Respect restrictions in museums and tourist attractions.',
        'Follow local rules regarding photography.',
      ],
      culturalTips: [
        'Respect local customs and public spaces.',
        'Be considerate when visiting religious and cultural sites.',
        'Follow instructions provided at tourist attractions.',
      ],
    ),

    'Dubai, UAE': TravelInfo(
      currencyName: 'UAE Dirham',
      currencyCode: 'AED',
      currencySymbol: 'د.إ',
      visaSummary:
          'Check the latest UAE entry and visa requirements before travelling.',
      passportValidity: 'Make sure your passport satisfies the current UAE entry requirements.',
      visaDocuments: [
        'Valid passport',
        'Visa or entry authorization, if required',
        'Flight details',
        'Accommodation details',
        'Proof of funds if required',
      ],
      localRules: [
        'Respect local laws and customs.',
        'Follow public behavior regulations.',
        'Follow photography restrictions.',
        'Observe rules at religious and cultural locations.',
      ],
      culturalTips: [
        'Dress appropriately for cultural and religious places.',
        'Respect local customs.',
        'Be mindful of public behavior.',
      ],
    ),

    'Singapore': TravelInfo(
      currencyName: 'Singapore Dollar',
      currencyCode: 'SGD',
      currencySymbol: 'S\$',
      visaSummary: 'Check the latest Singapore entry and visa requirements before travelling.',
      passportValidity: 'Ensure your passport meets the current Singapore entry requirements.',
      visaDocuments: [
        'Valid passport',
        'Visa or entry authorization, if required',
        'Flight details',
        'Accommodation details',
        'Travel documents',
      ],
      localRules: [
        'Follow public transport regulations.',
        'Do not ignore restrictions on prohibited items.',
        'Follow local cleanliness and public behavior rules.',
        'Observe photography restrictions where applicable.',
      ],
      culturalTips: [
        'Respect different cultures and religions.',
        'Follow instructions at public attractions.',
        'Be considerate in shared public spaces.',
      ],
    ),

    'London, UK': TravelInfo(
      currencyName: 'British Pound',
      currencyCode: 'GBP',
      currencySymbol: '£',
      visaSummary:
          'Check the latest UK visa and entry requirements before travelling.',
      passportValidity: 'Check the current UK passport and entry requirements before departure.',
      visaDocuments: [
        'Valid passport',
        'Visa or travel authorization, if required',
        'Travel itinerary',
        'Accommodation details',
        'Proof of funds if required',
      ],
      localRules: [
        'Follow public transport rules.',
        'Respect restrictions at tourist attractions.',
        'Follow local photography rules.',
        'Carry appropriate identification when required.',
      ],
      culturalTips: [
        'Respect queues and public spaces.',
        'Follow instructions at museums and attractions.',
        'Be respectful of local customs.',
      ],
    ),

    'Tokyo, Japan': TravelInfo(
      currencyName: 'Japanese Yen',
      currencyCode: 'JPY',
      currencySymbol: '¥',
      visaSummary: 'Check the latest Japan visa and entry requirements before travelling.',
      passportValidity:
          'Check the current passport validity and entry requirements.',
      visaDocuments: [
        'Valid passport',
        'Visa or entry authorization, if required',
        'Flight details',
        'Accommodation details',
        'Travel itinerary',
      ],
      localRules: [
        'Follow public transport etiquette and regulations.',
        'Respect rules at temples and shrines.',
        'Follow local waste-disposal rules.',
        'Observe photography restrictions.',
      ],
      culturalTips: [
        'Respect quiet and orderly public spaces.',
        'Follow etiquette when visiting temples and shrines.',
        'Be considerate on public transport.',
      ],
    ),

    'Bangkok, Thailand': TravelInfo(
      currencyName: 'Thai Baht',
      currencyCode: 'THB',
      currencySymbol: '฿',
      visaSummary: 'Check the latest Thailand visa and entry requirements before travelling.',
      passportValidity: 'Check the current passport validity requirements.',
      visaDocuments: [
        'Valid passport',
        'Visa or entry authorization, if required',
        'Flight details',
        'Accommodation details',
        'Travel itinerary',
      ],
      localRules: [
        'Respect religious and cultural sites.',
        'Follow local public behavior rules.',
        'Follow photography restrictions.',
        'Observe local transport regulations.',
      ],
      culturalTips: [
        'Dress appropriately when visiting temples.',
        'Respect religious customs.',
        'Be considerate toward local communities.',
      ],
    ),

    'Rome, Italy': TravelInfo(
      currencyName: 'Euro',
      currencyCode: 'EUR',
      currencySymbol: '€',
      visaSummary: 'Check the latest Schengen visa and Italy entry requirements before travelling.',
      passportValidity: 'Check the current passport validity requirements.',
      visaDocuments: [
        'Valid passport',
        'Visa application documents, if required',
        'Travel itinerary',
        'Accommodation details',
        'Travel insurance',
        'Proof of funds',
      ],
      localRules: [
        'Follow rules at museums and historical sites.',
        'Respect restrictions around monuments.',
        'Follow photography rules.',
        'Respect religious places.',
      ],
      culturalTips: [
        'Dress appropriately when visiting religious sites.',
        'Respect historical monuments.',
        'Follow instructions at tourist attractions.',
      ],
    ),

    'New York, USA': TravelInfo(
      currencyName: 'US Dollar',
      currencyCode: 'USD',
      currencySymbol: '\$',
      visaSummary:
          'Check the latest US visa and entry requirements before travelling.',
      passportValidity: 'Check the current US passport and entry requirements.',
      visaDocuments: [
        'Valid passport',
        'Visa or travel authorization, if required',
        'Travel itinerary',
        'Accommodation details',
        'Proof of funds if required',
      ],
      localRules: [
        'Follow local and state laws.',
        'Follow public transport regulations.',
        'Observe photography restrictions.',
        'Follow rules at tourist attractions.',
      ],
      culturalTips: [
        'Respect different cultures and communities.',
        'Follow instructions in public places.',
        'Be considerate in crowded areas.',
      ],
    ),
  };

  static TravelInfo getInfo(String destination) {
    return _destinationInfo[destination] ??
        TravelInfo(
          currencyName: 'Local Currency',
          currencyCode: 'N/A',
          currencySymbol: '',
          visaSummary: 'Check the latest visa and entry requirements for your destination.',
          passportValidity: 'Check the current passport validity requirements.',
          visaDocuments: [
            'Valid passport',
            'Visa or entry authorization, if required',
            'Travel itinerary',
            'Accommodation details',
          ],
          localRules: [
            'Check current local laws and regulations.',
            'Follow public transport rules.',
            'Respect local customs.',
          ],
          culturalTips: [
            'Respect local customs and traditions.',
            'Follow instructions at tourist attractions.',
          ],
        );
  }
}
