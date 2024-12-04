import 'package:flutter/material.dart';

class PledgedGiftsScreen extends StatefulWidget {
  const PledgedGiftsScreen({super.key});

  @override
  _PledgedGiftsScreenState createState() => _PledgedGiftsScreenState();
}

class _PledgedGiftsScreenState extends State<PledgedGiftsScreen> {
  // Track the pledge fulfillment status
  final Map<String, bool> pledgeFulfillmentStatus = {
    "Smartphone": false,
    "Headphones": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pledged Gifts"),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          buildPledgedGiftTile(
            context,
            "Smartphone",
            "Latest model smartphone, Price: \$799.99, Due: 2024-12-15",
          ),
          buildPledgedGiftTile(
            context,
            "Headphones",
            "Noise-canceling headphones, Price: \$199.99, Due: 2024-11-30",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.purple,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget buildPledgedGiftTile(
      BuildContext context, String title, String subtitle) {
    return Card(
      color: Colors.purple[50], // Light purple background for cards
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Cancel the Pledge') {
              // Placeholder for implementing the cancel functionality.
            } else if (value == 'Change Delivery Date') {
              // Placeholder for implementing the date change functionality.
            }
          },
          itemBuilder: (BuildContext context) {
            return {
              'Cancel the Pledge',
              'Change Delivery Date',
            }.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList()
              ..insert(
                0,
                PopupMenuItem<String>(
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Pledge Fulfilled"),
                          Switch(
                            value: pledgeFulfillmentStatus[title] ?? false,
                            onChanged: (bool value) {
                              setState(() {
                                pledgeFulfillmentStatus[title] = value;
                              });
                              Navigator.pop(context); // Close the menu
                              this.setState(() {});
                            },
                            activeColor: Colors.purple,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
          },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.purple, // Themed color for three-dot icon
          ),
        ),
      ),
    );
  }
}
