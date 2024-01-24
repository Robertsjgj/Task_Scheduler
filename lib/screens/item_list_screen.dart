import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/item_service.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: const ItemList(),
    );
  }
}

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Item> items = []; // List to store items

  @override
  void initState() {
    super.initState();
    // Fetch items from the service when the screen is loaded
    items = ItemService.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].name),
          // Add more item details or actions as needed
        );
      },
    );
  }
}
