class NotificationService {
  static void sendNotification(String userId, String message) {
    // Implement notification sending logic here
    // This can involve using packages like `flutter_local_notifications`
    // or interacting with a backend service to send push notifications
    // For simplicity, let's print the notification to the console for now
    print('Notification sent to User $userId: $message');
  }
}
