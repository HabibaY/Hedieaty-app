import 'package:flutter/material.dart';

class GiftListScreen extends StatelessWidget {
  const GiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gifts for Event"),
        backgroundColor: Colors.purple, // Set the color theme
      ),
      body: ListView(
        children: [
          buildGiftCard(
              context, "Smartphone", "Category: Electronics, Price: \$799.99"),
          buildGiftCard(context, "Book: Flutter for Beginners",
              "Category: Books, Price: \$19.99"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createGift');
        },
        backgroundColor: Colors.purple, // Set the color theme
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildGiftCard(BuildContext context, String giftName, String details) {
    return Card(
      color: Colors.purple[50], // Set a light purple background for the card
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    giftName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    details,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.purple),
              onPressed: () {
                Navigator.pushNamed(context, '/editGift');
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Delete functionality can be implemented later
              },
            ),
          ],
        ),
      ),
    );
  }
}
