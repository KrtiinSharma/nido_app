import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'dart:io';
import 'advanced_options.dart';
import 'bookings.dart';
import 'main.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String userName = 'Ashish Chanchalani';
  ImageProvider profileImage = const AssetImage('lib/images/profile.png');
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BookingsScreen()),
          );
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/play');
          break;
        case 3:
          break;
      }
    }
  }

  Future<void> _editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );

    if (result != null) {
      setState(() {
        if (result['name'] != null && result['name'].isNotEmpty) {
          userName = result['name'];
        }
        if (result['image'] != null) {
          profileImage = FileImage(result['image'] as File);
        }
      });
    }
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        const SizedBox(height: 32),
        CircleAvatar(
          radius: 50,
          backgroundImage: profileImage,
        ),
        const SizedBox(height: 16),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '+91 8527275700',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: _editProfile,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.redAccent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Edit profile',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? subtitle,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                )
              : null,
          trailing: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.04), // Responsive padding
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 32),
            _buildMenuItem(
              Icons.group,
              'members',
              'find all your member profile here',
            ),
            _buildMenuItem(
              Icons.headset_mic,
              'support',
              null,
            ),
            _buildMenuItem(
              Icons.receipt,
              'transaction history',
              'find all your transactions here',
            ),
            _buildMenuItem(
              Icons.headset_mic,
              'support',
              null,
            ),
            _buildMenuItem(
              Icons.settings,
              'Advanced',
              null,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdvancedOptionsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}
