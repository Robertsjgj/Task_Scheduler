import 'package:flutter/material.dart';
import '../models/user.dart';

class UsersListScreen extends StatelessWidget {
  final List<User> users;

  UsersListScreen({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: users.map((user) {
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                title: Text('User: ${user.name}, ID: ${user.id}'),
                // Add more user details or actions as needed
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
