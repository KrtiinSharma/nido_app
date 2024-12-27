import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart for navigation
import 'account.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
        backgroundColor: const Color(0xFF292929), // Set the AppBar color
        foregroundColor: Colors.white, // Set the text and icon color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildBookingCard(
              status: 'Active',
              title: 'Cherry Blossom Group Tour 2025',
              location: 'Ambience Mall, New Delhi',
              date: '2 Dec 2024',
              validTill: 'Valid Till: 12th Nov 2024, 08:30PM',
            ),
            const SizedBox(height: 16),
            _buildBookingCard(
              status: 'Expired',
              title: 'Cherry Blossom Group Tour 2025',
              location: 'Ambience Mall, New Delhi',
              date: '2 Dec 2024',
              validTill: 'Valid Till: 12th Nov 2024, 08:30PM',
              isExpired: true,
            ),
            const SizedBox(height: 16),
            _buildBookingCard(
              status: 'Active',
              title: 'Cherry Blossom Group Tour 2025',
              location: 'Ambience Mall, New Delhi',
              date: '2 Dec 2024',
              validTill: 'Valid Till: 12th Nov 2024, 08:30PM',
            ),
            // Add more booking cards as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set to 1 for "Bookings" tab
        onTap: (index) {
          switch (index) {
            case 0: // Home tab
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DashboardScreen()), // Navigate to Home
              );
              break;
            case 1: // Bookings tab
              // Already on Bookings screen
              break;
            case 2: // Play tab
              // Navigate to Play screen (implement as needed)
              break;
            case 3: // Me tab
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AccountScreen()), // Navigate to Me
              );
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_filled),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard({
    required String status,
    required String title,
    required String location,
    required String date,
    required String validTill,
    bool isExpired = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isExpired ? const Color(0xFF2A2A2A) : const Color(0xFF363636),
        borderRadius: BorderRadius.circular(12),
        border: isExpired ? Border.all(color: Colors.purple, width: 2) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: TextStyle(
              color: isExpired ? Colors.purple : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            validTill,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
