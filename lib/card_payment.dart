import 'package:flutter/material.dart';
import 'order_summary.dart'; // Import the Order Summary Screen

class CardPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292929),
      appBar: AppBar(
        title:
            const Text('Card Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF292929),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate successful payment and navigate to Order Summary
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSummaryScreen(
                  orderNumber: '1234', // Example order number
                  tickets: [
                    {
                      'tour': 'Cherry Blossom Group Tour 2025',
                      'name': 'John Doe',
                      'ticketNumber': '78626'
                    },
                    {
                      'tour': 'Cherry Blossom Group Tour 2025',
                      'name': 'John Doe',
                      'ticketNumber': '87651'
                    },
                  ],
                ),
              ),
            );
          },
          child: const Text('Complete Payment'),
        ),
      ),
    );
  }
}
