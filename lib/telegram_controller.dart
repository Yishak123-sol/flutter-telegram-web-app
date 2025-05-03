import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TelegramController extends GetxController {
  Map<String, dynamic>? telegramData;

  @override
  void onInit() {
    super.onInit();
    getTelegramData();
  }

  void getTelegramData() {
    telegramData = initTelegramWebApp();
    if (telegramData != null) {
      debugPrint('Telegram Data: $telegramData');
    } else {
      debugPrint('Telegram data is null. Opened outside Telegram?');
    }
    update();
  }

  static Map<String, dynamic>? initTelegramWebApp() {
    final result = js.context.callMethod('initTelegramWebApp');
    if (result != null) {
      String jsonString = js.context['JSON'].callMethod('stringify', [result]);
      return jsonDecode(jsonString);
    }
    return null;
  }

  static void sendTelegramData(String data) {
    js.context.callMethod('sendTelegramData', [data]);
  }

  static void setMainButton(String text, bool isVisible) {
    js.context.callMethod('setMainButton', [text, isVisible]);
  }
}
