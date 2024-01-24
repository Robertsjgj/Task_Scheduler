import '../models/group.dart';

class GroupService {
  static Group createGroup(String groupName) {
    // Implement group creation logic here
    // You may use a database or other storage mechanism
    // For simplicity, let's create a new Group instance for now
    Group newGroup = Group(id: DateTime.now().toString(), name: groupName);
    // Save the group or perform other group setup actions
    return newGroup;
  }

  static void addTaskToGroup(Group group, String taskDescription) {
    // Add a task to the specified group
    group.addTask(taskDescription);
  }
}
