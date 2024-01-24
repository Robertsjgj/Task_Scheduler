import '../models/item.dart';

class ItemService {
  static List<Item> getItems() {
    // Implement item fetching logic here
    // You may use a database or other storage mechanism
    // For simplicity, let's create a few sample items for now
    return [
      Item(id: '1', name: 'Toilet Paper'),
      Item(id: '2', name: 'Dish Soap'),
      Item(id: '3', name: 'Sponges'),
      // Add more items as needed
    ];
  }
}
