import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'telegram_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TelegramController controller = Get.put(TelegramController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Telegram WebApp Example',
      home: Scaffold(
        appBar: AppBar(title: Text("Telegram WebApp")),
        body: GetBuilder<TelegramController>(builder: (_) {
          final user = controller.telegramData?['user'];
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (user != null)
                  Text("Hello ${user['first_name']}!",
                      style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: () {
                    TelegramController.setMainButton("Submit", true);
                  },
                  child: Text("Show Main Button"),
                ),
                ElevatedButton(
                  onPressed: () {
                    TelegramController.sendTelegramData(
                        "User clicked the button!");
                  },
                  child: Text("Send Data Back"),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
