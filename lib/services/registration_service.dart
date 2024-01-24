import '../models/user.dart';

class RegistrationService {
  static Future<User> registerUser(String name) async {
    // Implement user registration logic here
    // You may use a database or other storage mechanism
    // For simplicity, let's create a new User instance for now
    User newUser = User(id: DateTime.now().toString(), name: name);
    // Save the user or perform other registration actions

    // For demonstration purposes, let's add a delay to simulate async operation
    await Future.delayed(Duration(seconds: 2));

    // Return the newly created user or any relevant information
    return newUser;
  }
}

