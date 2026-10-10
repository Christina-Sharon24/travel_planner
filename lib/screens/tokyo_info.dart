class TokyoDestinationData {
  static const String destination = 'Tokyo, Japan';

  static const Map<String, dynamic> data = {
    'overview': {
      'country': 'Japan',
      'currency': 'Japanese Yen',
      'currencyCode': 'JPY',
      'currencySymbol': '¥',
      'language': 'Japanese',
      'timeZone': 'JST (UTC+9)',
      'powerPlug': 'Type A',
      'electricity': '100 V',
    },

    'gettingThere': {
      'airports': [
        'Haneda Airport (HND)',
        'Narita International Airport (NRT)',
      ],
      'guidance': [
        'Compare airport transfer times and prices.',
        'Check baggage allowance before booking flights.',
        'Keep passport and booking confirmations accessible.',
        'Check current flight schedules before departure.',
      ],
      'liveChecks': [
        'Flight prices and availability',
        'Flight delays and cancellations',
        'Airport transfer fares and schedules',
      ],
    },

    'accommodation': {
      'areas': [
        {
          'name': 'Asakusa',
          'description':
              'Traditional atmosphere, temples and historic streets.',
        },
        {
          'name': 'Shinjuku',
          'description': 'Major transport connections, shopping and nightlife.',
        },
        {
          'name': 'Tokyo Station',
          'description':
              'Convenient rail connections and access to central Tokyo.',
        },
        {
          'name': 'Shibuya',
          'description':
              'Shopping, youth culture, restaurants and entertainment.',
        },
      ],
      'guidance': [
        'Compare accommodation location and station access.',
        'Check cancellation conditions and check-in times.',
        'Confirm the final price, taxes and additional charges.',
      ],
      'liveChecks': [
        'Room availability',
        'Nightly rates',
        'Guest reviews and current property policies',
      ],
    },

    'food': {
      'recommendations': [
        {
          'name': 'Sushi',
          'category': 'Japanese cuisine',
          'description':
              'Vinegared rice served with seafood or other toppings.',
        },
        {
          'name': 'Ramen',
          'category': 'Noodles',
          'description': 'Noodles served in a variety of broths and toppings.',
        },
        {
          'name': 'Tempura',
          'category': 'Japanese cuisine',
          'description': 'Lightly battered and fried vegetables or seafood.',
        },
        {
          'name': 'Soba',
          'category': 'Noodles',
          'description': 'Buckwheat noodles served hot or cold.',
        },
        {
          'name': 'Udon',
          'category': 'Noodles',
          'description': 'Thick wheat noodles commonly served in broth.',
        },
        {
          'name': 'Onigiri',
          'category': 'Quick meal',
          'description': 'Rice balls with assorted fillings.',
        },
      ],
      'tips': [
        'Check ingredient lists for allergies.',
        'Ask about meat, fish stock and other ingredients if needed.',
        'Look for vegetarian options before ordering.',
        'Confirm restaurant opening hours and prices.',
      ],
      'liveChecks': [
        'Restaurant availability',
        'Current menus and prices',
        'Opening hours',
      ],
    },

    'gettingAround': {
      'transportOptions': [
        {
          'name': 'JR trains',
          'description': 'Useful for connecting major districts across Tokyo.',
        },
        {
          'name': 'Tokyo Metro',
          'description':
              'Extensive subway network serving many central destinations.',
        },
        {
          'name': 'Toei Subway',
          'description': 'Additional subway lines serving Tokyo.',
        },
        {
          'name': 'Local buses',
          'description':
              'Useful for some journeys not directly served by trains.',
        },
        {
          'name': 'Taxis',
          'description':
              'Convenient for direct trips, but usually more expensive.',
        },
      ],
      'tips': [
        'Consider a Suica or PASMO IC card for participating services.',
        'Check the last train before planning a late evening.',
        'Allow extra time for transfers in large stations.',
        'Follow station signs and boarding queues.',
        'Keep luggage clear of doors and passenger walkways.',
      ],
      'liveChecks': [
        'Train disruptions and service changes',
        'Current fares and timetables',
        'Taxi fares and journey estimates',
      ],
    },

    'places': {
      'attractions': [
        {
          'name': 'Senso-ji Temple',
          'area': 'Asakusa',
          'description':
              'Historic Buddhist temple with traditional architecture.',
          'duration': '1–2 hours suggested',
          'cost': 'Check current details; grounds are generally free.',
        },
        {
          'name': 'Nakamise Shopping Street',
          'area': 'Asakusa',
          'description':
              'Shopping street featuring souvenirs and Japanese snacks.',
          'duration': '30–60 minutes suggested',
          'cost': 'Free to browse; purchases cost extra.',
        },
        {
          'name': 'Shibuya Scramble Crossing',
          'area': 'Shibuya',
          'description':
              'Famous pedestrian crossing surrounded by city activity.',
          'duration': '30–60 minutes suggested',
          'cost': 'Free',
        },
        {
          'name': 'Meiji Jingu Shrine',
          'area': 'Harajuku',
          'description': 'Shinto shrine surrounded by a peaceful wooded area.',
          'duration': '1–2 hours suggested',
          'cost': 'Check current garden or special-area charges.',
        },
        {
          'name': 'Ueno Park',
          'area': 'Ueno',
          'description':
              'Large park near museums and other cultural attractions.',
          'duration': '2–3 hours suggested',
          'cost': 'Park access and individual attractions may differ.',
        },
        {
          'name': 'Tokyo Skytree',
          'area': 'Sumida',
          'description': 'Observation tower offering views across Tokyo.',
          'duration': '1–3 hours suggested',
          'cost': 'Admission charges apply; verify current ticket prices.',
        },
      ],
      'liveChecks': [
        'Opening hours and closure dates',
        'Admission fees and reservations',
        'Seasonal events and crowd conditions',
      ],
    },

    'visaEntry': {
      'summary':
          'Entry and visa requirements depend on nationality, residence, '
          'travel purpose and length of stay.',
      'checklist': [
        'Check visa requirements for your passport.',
        'Confirm passport validity requirements.',
        'Check whether a visa or travel authorization is required.',
        'Prepare accommodation and return-travel details if requested.',
        'Review current customs and restricted-item rules.',
        'Check the official arrival procedures before departure.',
      ],
      'officialVerificationRequired': true,
    },

    'currency': {
      'name': 'Japanese Yen',
      'code': 'JPY',
      'symbol': '¥',
      'tips': [
        'Carry a small amount of cash for places that do not accept cards.',
        'Check foreign transaction fees with your bank.',
        'Use reputable exchange providers or ATMs.',
        'Keep a record of spending in yen.',
      ],
      'converterNotice':
          'Any exchange rate entered in the app is an example only '
          'unless it has been verified and dated.',
      'liveChecks': [
        'JPY exchange rate',
        'ATM fees and card acceptance',
        'Bank and exchange-provider rates',
      ],
    },

    'localRules': {
      'rules': [
        'Follow posted instructions at temples and shrines.',
        'Respect queues and other passengers on public transport.',
        'Observe designated smoking areas and local restrictions.',
        'Follow photography restrictions at private or religious sites.',
        'Dispose of rubbish appropriately and follow local signs.',
        'Follow posted rules for restaurants, shops and attractions.',
      ],
      'culturalTips': [
        'Be considerate in quiet public spaces.',
        'Keep phone calls quiet on trains.',
        'Follow shoe-removal instructions where posted.',
        'Ask permission before photographing people closely.',
        'Follow local customs without assuming every venue has identical rules.',
      ],
      'notice':
          'Rules may differ by venue and municipality. Verify current '
          'requirements before travel.',
    },

    'safety': {
      'tips': [
        'Keep your passport and valuables secure in crowded areas.',
        'Plan how to return to your accommodation at night.',
        'Use clearly identified transport services.',
        'Check weather and disaster alerts.',
        'Follow official instructions during earthquakes or other emergencies.',
        'Keep travel insurance and important contacts accessible.',
        'Check medication import restrictions before carrying medicines.',
      ],
      'cautions': [
        'Heavy rain and typhoons can affect travel during some seasons.',
        'Earthquakes can occur; learn the nearest evacuation guidance.',
        'Avoid entering unfamiliar venues under pressure from street touts.',
        'Check food ingredients and allergy risks before eating.',
      ],
      'liveChecks': [
        'Weather warnings and disaster alerts',
        'Travel advisories',
        'Local service disruptions',
        'Current medical and insurance requirements',
      ],
    },

    'packing': {
      'documents': [
        'Passport and required visa documents',
        'Flight and accommodation confirmations',
        'Travel insurance information',
        'Payment cards and some Japanese yen',
        'Copies of important documents',
      ],
      'essentials': [
        'Phone and charging cable',
        'Compatible power adapter',
        'Portable power bank',
        'Comfortable walking shoes',
        'Reusable bag',
        'Personal medication and prescriptions',
      ],
      'weatherDependent': [
        'Light layers for spring and autumn',
        'Breathable clothing and sun protection for summer',
        'Rain jacket or compact umbrella',
        'Warm coat and layers for winter',
      ],
      'safetyItems': [
        'Emergency contact list',
        'Small first-aid kit',
        'Offline map and translation resources',
      ],
    },

    'weather': {
      'spring': 'March–May: variable temperatures; use layers.',
      'summer': 'June–August: hot and humid; rain and typhoon risks may occur.',
      'autumn': 'September–November: conditions cool gradually; rain and typhoons can affect some periods.',
      'winter': 'December–February: generally cool to cold; pack warm layers.',
      'notice':
          'These are seasonal patterns, not live weather observations. '
          'Check a current forecast and official warnings before travel.',
    },

    'emergency': {
      'police': '110',
      'fireAndAmbulance': '119',
      'guidance': [
        'State your location as clearly as possible.',
        'Ask hotel staff or a nearby trusted person for help if needed.',
        'Keep your accommodation address available in Japanese.',
        'Follow official emergency and evacuation instructions.',
      ],
      'notice': 'Confirm current contact and language-support information before travel.',
    },

    'communication': {
      'language': 'Japanese',
      'phrases': [
        {'japanese': 'Sumimasen', 'meaning': 'Excuse me / Sorry'},
        {'japanese': 'Arigatō gozaimasu', 'meaning': 'Thank you'},
        {
          'japanese': 'Eigo o hanasemasu ka?',
          'meaning': 'Can you speak English?',
        },
        {'japanese': 'Tasukete kudasai', 'meaning': 'Please help'},
        {
          'japanese': 'Eki wa doko desu ka?',
          'meaning': 'Where is the station?',
        },
      ],
      'connectivityTips': [
        'Compare travel SIM and eSIM options before departure.',
        'Download offline maps and translation resources.',
        'Save your hotel address in Japanese.',
        'Check data limits and coverage before purchasing connectivity.',
      ],
    },

    'budget': {
      'categories': [
        'Flights',
        'Accommodation',
        'Food',
        'Local transport',
        'Attractions and activities',
        'Shopping',
        'Travel insurance',
        'Emergency reserve',
      ],
      'notice':
          'Calculate totals using the traveller’s dates, group size and '
          'chosen options. Do not treat stored example prices as live quotes.',
    },
  };
}
