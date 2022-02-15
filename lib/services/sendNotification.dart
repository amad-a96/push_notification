import 'dart:convert';

import 'package:http/http.dart' as http;

class SendNotificationManager {
  sendNotification(
      {List<String>? tokens,
      String title = '',
      String description = ''}) async {
    for (var item in tokens!) {
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        "Authorization":
            "key=AAAAlhPDHBc:APA91bFa6yLwSrFpdnsF4p1ItuS5zlmtcOhXW6I_8My7pCpeLPCECY0mlUrTGCxvRolDnCRF2giVKHPGWTAJzVDJOil4NMppmGCC1KoY68GEvH82ok5XJGG2Bb4Kp4tKy9aorPErAmZk",
      };
      final body = jsonEncode({
        "to": item,
        "notification": {
          "title": title,
          "body": description,
          "mutable_content": true,
          "sound": "Tri-tone"
        },
        "data": {
          "url": "<url of media image>",
          "dl": "<deeplink action on tap of notification>",
         "click_action": "FLUTTER_NOTIFICATION_CLICK",
         "screen": "MyScreen",
        }
      });
      await http
          .post(url, headers: headers, body: body)
          .then((value) => print(value.body.toString()));
    }
  }
}
