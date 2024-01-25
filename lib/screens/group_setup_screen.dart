import 'package:flutter/material.dart';
import 'package:task_tender/screens/item_list_screen.dart';
import 'package:task_tender/screens/schedule_screen.dart';
import '../services/group_service.dart';
import '../screens/create_group_screen.dart';

class GroupSetupScreen extends StatelessWidget {
  const GroupSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Setup'),
      ),
      body: const GroupSetupForm(),
    );
  }
}

class GroupSetupForm extends StatefulWidget {
  const GroupSetupForm({super.key});

  @override
  State<GroupSetupForm> createState() => _GroupSetupFormState();
}

class _GroupSetupFormState extends State<GroupSetupForm> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Setup'),
      ),
      body: const GroupSetupForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen to create a group
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateGroupScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
