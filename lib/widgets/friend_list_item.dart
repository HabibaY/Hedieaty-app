import 'package:flutter/material.dart';

class FriendListItem extends StatelessWidget {
  final String friendName;
  final int upcomingEvents;

  const FriendListItem(
      {super.key, required this.friendName, required this.upcomingEvents});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(friendName),
      subtitle: Text(upcomingEvents > 0
          ? "Upcoming Events: $upcomingEvents"
          : "No Upcoming Events"),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pushNamed(context, '/friendEvents', arguments: friendName);
      },
    );
  }
}
