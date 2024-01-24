import 'package:flutter/material.dart';
import 'package:task_tender/screens/schedule_screen.dart';
import '../services/group_service.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _groupNameController,
            decoration: const InputDecoration(labelText: 'Group Name'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Call group service to create a new group
              GroupService.createGroup(_groupNameController.text);
              //Navigator.pop(context); // Navigate back to the previous screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ScheduleScreen(), // Replace with your next screen
                ),
              );
            },
            child: const Text('Create Group'),
          ),
        ],
      ),
    );
  }
}
