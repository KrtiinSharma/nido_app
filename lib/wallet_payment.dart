import 'package:flutter/material.dart';

class WalletPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292929),
      appBar: AppBar(
        title:
            const Text('Wallet Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF292929),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: const Text(
          'Wallet Payment Method',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
