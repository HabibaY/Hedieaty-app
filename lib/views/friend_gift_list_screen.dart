import 'package:flutter/material.dart';

class FriendGiftListScreen extends StatelessWidget {
  const FriendGiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Friend's Gift List")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Smartphone"),
            subtitle: const Text("Category: Electronics, Price: \$799.99"),
            trailing: ElevatedButton(
              onPressed: () {
                // Pledge Logic
              },
              child: const Text("Pledge"),
            ),
          ),
          ListTile(
            title: const Text("Book: Flutter for Beginners"),
            subtitle: const Text("Category: Books, Price: \$19.99"),
            trailing: ElevatedButton(
              onPressed: () {
                // Pledge Logic
              },
              child: const Text("Pledge"),
            ),
          ),
        ],
      ),
    );
  }
}
