import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/group_list_screen.dart';
import 'screens/item_list_screen.dart';
import 'screens/schedule_list_screen.dart';
import 'screens/users_list_screen.dart';
import '../models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roommate Essentials',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<User> _users = []; // List to store users

  final List<Widget> _tabs = [
    UsersListScreen(users: []), // Users page
    GroupListScreen(groups: []), // Group page
    ItemListScreen(groups: []), // Items page
    ScheduleListScreen(schedules: []), // Schedule page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roommate Essentials'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.people_rounded),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.list),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                User? newUser = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationScreen(),
                  ),
                );

                if (newUser != null) {
                  setState(() {
                    _users.add(newUser);
                  });
                  // Pass the updated _users list to UsersListScreen
                  _tabs[0] = UsersListScreen(users: _users);
                }
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}

