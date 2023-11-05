import 'local_notification_controller.dart';

enum Channel {
  test("dev_test_channel", "dev_test", "For Testing"),
  queue("todo_channel", "todo", "Todo Change");

  final String channelID;
  final String channelName;
  final String description;

  const Channel(this.channelID, this.channelName, this.description);
}

class LocalNotificationMessage {
  final String id;
  final String title;
  final String message;
  final String? image;
  final Channel channel;
  LocalNotificationMessage(
    this.id,
    this.title,
    this.message, {
    this.image,
    required this.channel,
  });

  final LocalNotificationController _localService =
      LocalNotificationController();

  void showNotification() {
    
    _localService.show(id, title, message, image: image, channel: channel);
  }
}
