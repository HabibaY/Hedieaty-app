import 'package:flutter/material.dart';

class CreateEditGiftScreen extends StatelessWidget {
  final String? giftId; // Optional for editing purposes

  const CreateEditGiftScreen({super.key, this.giftId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(giftId != null ? "Edit Gift" : "Create Gift"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: "Gift Name")),
              TextFormField(
                  decoration: const InputDecoration(labelText: "Description")),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                      value: "Electronics", child: Text("Electronics")),
                  DropdownMenuItem(value: "Books", child: Text("Books")),
                ],
                decoration: const InputDecoration(labelText: "Category"),
                onChanged: (value) {},
              ),
              TextFormField(decoration: const InputDecoration(labelText: "Price")),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save Gift Logic Here
                },
                child: const Text("Save Gift"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
