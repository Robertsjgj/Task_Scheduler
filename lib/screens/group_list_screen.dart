import 'package:flutter/material.dart';
import '../models/group.dart';

class GroupListScreen extends StatelessWidget {
  final List<Group> groups;

  GroupListScreen({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Group List Screen'),
          if (groups.isNotEmpty)
            Column(
              children: groups.map((group) {
                return ListTile(
                  title: Text('Group: ${group.name}, ID: ${group.id}'),
                  // Add more group details or actions as needed
                );
              }).toList(),
            ),
          if (groups.isEmpty) Text('No groups on the device.'),
        ],
      ),
    );
  }
}
