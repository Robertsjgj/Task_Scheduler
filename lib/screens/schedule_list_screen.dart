import 'package:flutter/material.dart';
import '../models/schedule.dart';

class ScheduleListScreen extends StatelessWidget {
  final List<Schedule> schedules;

  ScheduleListScreen({Key? key, required this.schedules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Schedule List Screen'),
          if (schedules.isNotEmpty)
            Column(
              children: schedules.map((schedule) {
                return ListTile(
                  title: Text('User: ${schedule.userId}, Item: ${schedule.assignedItemId}'),
                  // Add more schedule details or actions as needed
                );
              }).toList(),
            ),
          if (schedules.isEmpty) Text('No schedules on the device.'),
        ],
      ),
    );
  }
}
