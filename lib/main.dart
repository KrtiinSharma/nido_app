import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor:
            Color(0xFF292929), // Set global background color
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('dashboard', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.card_giftcard),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Play & Win Section
            playAndWinSection(),

            // Coins Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF363636),
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
                        image: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.cR3ECYzCconJzm_HqMvg0wHaHa&pid=Api&P=0&h=180',
                        ), // Replace this URL later with your actual coin image
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

            // Recommended for You Section
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
                _buildIconOption(Icons.payment, 'payment history'),
                _buildIconOption(Icons.receipt, 'view invoice'),
                _buildIconOption(Icons.account_balance, 'bank account'),
                _buildIconOption(Icons.wallet, 'wallet'),
              ],
            ),
            const SizedBox(height: 16),

            // Upcoming Bookings Section
            _buildSectionTitle('Upcoming bookings', 'See all'),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildUpcomingCard(
                    'Cherry Blossom Group Tour 2025',
                    'Tomorrow at 2:30 PM',
                    'lib/images/tower.png',
                  ),
                  const SizedBox(width: 8),
                  _buildUpcomingCard(
                    'Cliffside Hike Adventure',
                    'Next Week',
                    'lib/images/cherry.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Explore Section
            _buildSectionTitle('Explore', 'See all'),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCard(
                    'Cherry Blossom Group Tour 2025',
                    'New Delhi',
                    'lib/images/tower.png',
                  ),
                  const SizedBox(width: 8),
                  _buildCard(
                    'City Lights Tour',
                    'New Delhi',
                    'lib/images/cherry.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Banner Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Redeem Image
                  Image.asset(
                    'lib/images/redeem.png', // Path to your image
                    height: 60, // Adjust as needed
                    width: 60, // Adjust as needed
                  ),
                  const SizedBox(width: 16), // Spacing between image and text

                  // Text and Button
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
                              borderRadius:
                                  BorderRadius.circular(24), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24), // Adjust padding
                          ),
                          child: const Text(
                            'Redeem Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.book),
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

  Widget _buildIconOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 36, color: Colors.redAccent),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildSectionTitle(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {},
          child: Text(action, style: const TextStyle(color: Colors.redAccent)),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String location, String imagePath) {
    return Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              height: 80, // Adjust height as needed
              width: 80, // Adjust width as needed
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
            Container(
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
            const Spacer(), // Pushes barcode to the right
            Image.asset(
              'lib/images/barcode.png', // Path to your barcode image
              height: 22, // Adjust height as needed
              width: 22, // Adjust width as needed
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
                'Ashish Chanchalani',
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
