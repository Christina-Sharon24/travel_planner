import 'package:flutter/material.dart';

class SosPage extends StatelessWidget {
  final String destination;
  final String emergencyNumber;

  const SosPage({
    super.key,
    required this.destination,
    required this.emergencyNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade700,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.notifications_active,
                color: Colors.yellowAccent,
                size: 54,
              ),

              const SizedBox(height: 16),


              const Text(
                'SOS ACTIVATED',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Help is being coordinated',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 24),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'TRAVEL DESTINATION',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      destination,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'LOCAL EMERGENCY NUMBER',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      emergencyNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),


              ElevatedButton.icon(
                onPressed: () {

                },

                icon: const Icon(
                  Icons.call,
                  color: Colors.red,
                ),

                label: Text(
                  'Call $emergencyNumber',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 10),


              ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),

                label: const Text(
                  'Emergency Contact',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 10),


              ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),

                label: const Text(
                  'Share Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const Spacer(),


              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  'Cancel SOS',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}