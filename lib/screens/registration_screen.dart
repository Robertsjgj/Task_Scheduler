import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/registration_service.dart';
import '../screens/group_setup_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  void _registerUser() async {
  setState(() {
    _isLoading = true;
  });

  try {
    User newUser = await RegistrationService.registerUser(_nameController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User registered successfully'),
      ),
    );

    // Pass the user data back to the previous screen
    Navigator.pop(context, newUser);
  } catch (e) {
    print('Registration error: $e');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registration error: $e'),
      ),
    );
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _registerUser,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: const Center(
        child: Text('This is the next screen after registration.'),
      ),
    );
  }
}
