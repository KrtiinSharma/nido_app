import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'dart:convert';
import 'bookings.dart';
import 'account.dart';
import 'payment_history.dart';
import 'tour_details.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nido',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF292929),
      ),
      home: LoginScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  List<dynamic> tours = [];
  List<dynamic> members = [];
  List<dynamic> paymentMethods = [];
  Map<String, dynamic> messages = {};

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      tours = data['tours'];
      members = data['members'];
      paymentMethods = data['payment']['methods'];
      messages = data['messages'];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // Navigate to Home
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BookingsScreen()),
        );
        break;
      case 2:
        // Navigate to Play
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AccountScreen()),
        );
        break;
    }
  }

  Future<void> _scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        // Handle the scanned barcode result
        print('Scanned Barcode: ${result.rawContent}');
        // You can navigate to another screen or show a dialog with the result
      }
    } catch (e) {
      print('Error scanning barcode: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            playAndWinSection(),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xFF363636),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage('lib/images/cred.png'),
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '₹96,000',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'use CRED coins to claim\ntoday\'s rewards',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recommended for you',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconOption(context, Icons.payment, 'payment history'),
                _buildIconOption(context, Icons.receipt, 'view invoice'),
                _buildIconOption(
                    context, Icons.account_balance, 'bank account'),
                _buildIconOption(context, Icons.wallet, 'wallet'),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Upcoming bookings', 'See all'),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildUpcomingCard(
                    'Cherry Blossom Group Tour 2025',
                    'Tomorrow at 2:30 PM',
                    'lib/images/eiffel-tower-night-stockcake_3.png',
                  ),
                  const SizedBox(width: 8),
                  _buildUpcomingCard(
                    'Cherry Blossom Group Tour 2025',
                    'Next Week',
                    'lib/images/eiffel-tower-night-stockcake_4.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Explore', 'See all'),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCard(
                    'Cherry Blossom Group Tour 2025',
                    'New Delhi',
                    'lib/images/eiffel-tower-night-stockcake_1.png',
                  ),
                  const SizedBox(width: 8),
                  _buildCard(
                    'City Lights Tour',
                    'New Delhi',
                    'lib/images/eiffel-tower-night-stockcake_2.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Calculating the bank balance in your head? Here’s a simpler solution',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Add your action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: screenWidth * 0.1),
                          ),
                          child: const Text(
                            'Redeem Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: _scanBarcode,
                    child: Image.asset(
                      'lib/images/redeem.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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

  Widget _buildIconOption(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'payment history') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PaymentHistoryScreen()),
          );
        }
        // Add more conditions for other labels if needed
      },
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.redAccent),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            action,
            style: const TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String location, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TourDetailsScreen(
              title: title,
              location: location,
              date: '2 Dec 2024', // Example date
              duration: '1 hour', // Example duration
              description: 'Flight from New Delhi to Tokyo - Narita Apt...',
              price: '₹4,82,952 /Member\nTotal Price: ₹4,82,952',
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 200, // Fixed width for equal size
        height: 250, // Fixed height for equal size
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                height: 120, // Adjust height as needed
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingCard(String title, String date, String imagePath) {
    return Container(
      width: 220, // Adjusted width to prevent overflow
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              imagePath,
              height: 50, // Adjust height as needed
              width: 50, // Adjust width as needed
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14, // Reduced font size
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Limit to 2 lines
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12, // Reduced font size
                          ),
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget playAndWinSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Center "play & win" with barcode on the right
        Row(
          children: [
            const Spacer(), // Pushes "play & win" to the center
            GestureDetector(
              onTap: _scanBarcode,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Adjust size to content
                  children: [
                    Image.asset(
                      'lib/images/playandwin.png', // Replace with your icon path
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'play & win',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(), // Pushes barcode to the right
            GestureDetector(
              onTap: _scanBarcode,
              child: Image.asset(
                'lib/images/barcode.png', // Path to your barcode image
                height: 22, // Adjust height as needed
                width: 22, // Adjust width as needed
              ),
            ),
          ],
        ),
        const SizedBox(height: 16), // Add gap between sections
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'lib/images/profile.jpeg', // Replace with your profile image path
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Krtiin Sharma',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Add gap between profile and coins card
      ],
    );
  }
}
