import '../models/schedule.dart';

class ScheduleService {
  static Future<List<Schedule>> getSchedule() async {
    // Implement schedule fetching logic here
    // You may use a database or other storage mechanism
    // For simplicity, let's create a few sample schedules for now

    // Fetch schedules asynchronously (simulate a delay)
    await Future.delayed(Duration(seconds: 2));

    return [
      Schedule(userId: '1', assignedItemId: '1'), // User 1 assigned to Item 1
      Schedule(userId: '2', assignedItemId: '2'), // User 2 assigned to Item 2
      // Add more schedules as needed
    ];
  }
}
