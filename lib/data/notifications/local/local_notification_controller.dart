import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:to_do_list/core/constants/colors.dart';
import 'noti_channel.dart';

class LocalNotificationController {
  static final LocalNotificationController _singleton =
      LocalNotificationController._internal();
  factory LocalNotificationController() => _singleton;
  LocalNotificationController._internal() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) {});
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _plugin.initialize(initializationSettings);
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future show(
    String id,
    String title,
    String body, {
    String? image,
    required Channel channel,
    String? payload,
    bool? fullScreenIntent,
  }) async {
    BigPictureStyleInformation? pictureStyle;
    BigTextStyleInformation? textStyle;
    String? filePath;
    if (image != null && image.isNotEmpty) {
      filePath = await _downloadAndSaveFile(image, title);
      pictureStyle = BigPictureStyleInformation(
        FilePathAndroidBitmap(filePath),
        largeIcon: FilePathAndroidBitmap(filePath),
        contentTitle: title,
        hideExpandedLargeIcon: true,
      );
    } else {
      textStyle = BigTextStyleInformation(body, contentTitle: title);
    }
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.name,
      channel.channelID,
      channelDescription: channel.description,
      visibility: NotificationVisibility.public,
      importance: Importance.max,
      styleInformation: textStyle ?? pictureStyle,
      color: TDColors.mainColor,
      largeIcon: filePath == null ? null : FilePathAndroidBitmap(filePath),
      fullScreenIntent: fullScreenIntent ?? false,
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentSound: true,
        presentBadge: true,
        attachments: [
          if (filePath != null) IOSNotificationAttachment(filePath)
        ]);
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    _plugin.show(Random().nextInt(10000), title, body, platformChannelSpecifics,
        payload: payload);
  }
}
