import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEditEventScreen extends StatefulWidget {
  final String? eventId; // Optional for editing purposes
  final DateTime? initialDate;

  const CreateEditEventScreen({super.key, this.eventId, this.initialDate});

  @override
  _CreateEditEventScreenState createState() => _CreateEditEventScreenState();
}

class _CreateEditEventScreenState extends State<CreateEditEventScreen> {
  late TextEditingController _dateController;
  late TextEditingController _nameController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _nameController = TextEditingController();
    _locationController = TextEditingController();
    _dateController = TextEditingController();

    // Pre-fill the date if initialDate is provided
    if (widget.initialDate != null) {
      _dateController.text =
          DateFormat('yyyy-MM-dd').format(widget.initialDate!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventId != null ? "Edit Event" : "Create Event"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Event Name"),
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: "Date"),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: widget.initialDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    _dateController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  }
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: "Location"),
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: "Birthday", child: Text("Birthday")),
                  DropdownMenuItem(value: "Wedding", child: Text("Wedding")),
                ],
                decoration: const InputDecoration(labelText: "Category"),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save Event Logic Here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Purple color for button
                ),
                child: const Text(
                  "Save Event",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // White text color
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
