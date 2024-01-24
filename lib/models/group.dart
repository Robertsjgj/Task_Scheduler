class Task {
  final String id;
  final String description;
  bool isCompleted;

  Task({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });
}

class Group {
  final String id;
  final String name;
  final List<Task> tasks;

  Group({
    required this.id,
    required this.name,
    List<Task>? tasks,
  }) : tasks = tasks ?? [];

  void addTask(String taskDescription) {
    tasks.add(Task(id: DateTime.now().toString(), description: taskDescription));
  }
}
