import 'package:flutter/material.dart';
import '../models/schedule.dart';
import '../services/schedule_service.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Schedule'),
      ),
      body: FutureBuilder<List<Schedule>>(
        future: ScheduleService.getSchedule(), // Fetch schedule asynchronously
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching schedule: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No schedule available.'));
          } else {
            return ScheduleList(schedule: snapshot.data!);
          }
        },
      ),
    );
  }
}

class ScheduleList extends StatefulWidget {
  final List<Schedule> schedule;

  const ScheduleList({Key? key, required this.schedule}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.schedule.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('User: ${widget.schedule[index].userId} - Item: ${widget.schedule[index].assignedItemId}'),
          // Add more schedule details or actions as needed
        );
      },
    );
  }
}
