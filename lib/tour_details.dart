import 'package:flutter/material.dart';

class TourDetailsScreen extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String duration;
  final String description;
  final String price;
  final String imagePath;

  const TourDetailsScreen({
    Key? key,
    required this.title,
    required this.location,
    required this.date,
    required this.duration,
    required this.description,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 231, // Adjust height as needed
            ),
          ),
          // Top bar with icons
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Title below the image
          Positioned(
            top: 200, // Adjust based on image height
            left: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Content below the image
          Positioned(
            top: 231, // Adjust based on image height
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.7), // Semi-transparent background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'About us',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'lib/images/profile.png', // Path to your profile image
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Dunzo Tourism Pvt Ltd.',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Add booking action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Button color
                      padding: const EdgeInsets.symmetric(
                          vertical: 12), // Button padding
                    ),
                    child: const Text('Book'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
