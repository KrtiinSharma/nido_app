import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292929),
      appBar: AppBar(
        backgroundColor: const Color(0xFF292929),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Payment history',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.04), // Responsive padding
        children: [
          _buildPaymentItem('1,000',
              'win a month subscription from headspace...', '18th Mar', 'Cash'),
          _buildPaymentItem('1,000',
              'win a month subscription from headspace...', '18th Mar', 'Card'),
          // Add more items as needed
        ],
      ),
    );
  }

  Widget _buildPaymentItem(
      String amount, String description, String date, String type) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: const Icon(Icons.receipt, color: Colors.redAccent),
      title: Text(
        amount,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Chip(
            label: Text(
              type,
              style: const TextStyle(fontSize: 10),
            ),
            backgroundColor: type == 'Cash' ? Colors.green : Colors.blueGrey,
            labelPadding: const EdgeInsets.symmetric(horizontal: 0),
            labelStyle: const TextStyle(color: Colors.white),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
