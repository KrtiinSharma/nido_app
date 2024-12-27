import 'package:flutter/material.dart';

class AdvancedOptionsScreen extends StatelessWidget {
  const AdvancedOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Options'),
        backgroundColor: const Color(0xFF292929),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMenuItem(
              Icons.history,
              'Transaction History',
              'find all your transactions here',
            ),
            _buildMenuItem(
              Icons.security,
              'Manage CRED Protect',
              'linked email id’s and WhatsApp',
            ),
            _buildMenuItem(
              Icons.settings,
              'Manage Account',
              'login details and communication preferences',
            ),
            _buildMenuItem(
              Icons.payment,
              'Payment Settings',
              'manage your payment methods',
            ),
            _buildMenuItem(
              Icons.location_on,
              'Manage Addresses',
              'all your addresses here',
            ),
            _buildMenuItem(
              Icons.headset_mic,
              'Support',
              null,
            ),
            _buildMenuItem(
              Icons.info,
              'About',
              null,
            ),
            _buildLogoutItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? subtitle) {
    return Container(
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
    );
  }

  Widget _buildLogoutItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF483030),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.white),
        title: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
        onTap: () {
          // Add your logout logic here
        },
      ),
    );
  }
}
