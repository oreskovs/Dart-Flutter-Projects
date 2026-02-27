import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Shipping Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(hintText: "Enter your address"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Credit Card"),
              trailing: Icon(Icons.check_circle, color: Colors.cyan),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Success!"),
                      content: const Text("Order placed successfully."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("PLACE ORDER"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
