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
      // Call registration service to register the user
      User newUser = await RegistrationService.registerUser(_nameController.text);

      // Navigate to the next screen or perform any other action
      // For now, let's print the registered user's information
      print('Registered User: ${newUser.name}, ID: ${newUser.id}');

      // Show a SnackBar without directly using the BuildContext
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User registered successfully'),
        ),
      );

      // Navigate to the next screen (replace with your actual navigation logic)
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GroupSetupScreen(), // Replace with your next screen
        ),
      );
    } catch (e) {
      // Handle registration error (e.g., display an error message)
      print('Registration error: $e');

      // Show a SnackBar for registration error
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
              child: _isLoading ? const CircularProgressIndicator() : const Text('Register'),
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
