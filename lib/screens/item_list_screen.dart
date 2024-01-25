import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/group.dart';
import '../services/item_service.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key, required List groups});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: ItemList(groups: [],),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<Group> groups;

  ItemList({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Item List Screen'),
          if (groups.isNotEmpty)
            Column(
              children: groups.map((group) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Group: ${group.name}, ID: ${group.id}'),
                      // Add more group details or actions as needed
                    ),
                    // Display items for the group
                    ...group.tasks.map((task) {
                      return ListTile(
                        title: Text('Item: ${task.description}'),
                        // Add more item details or actions as needed
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
            ),
          if (groups.isEmpty) Text('No items on the device.'),
        ],
      ),
    );
  }
}
