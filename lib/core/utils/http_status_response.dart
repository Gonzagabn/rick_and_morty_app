import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

abstract class HttpStatusResponse {
  static verifyData(data, {callback}) async {
    if (data == 200) {
      return callback;
    } else if (data == 500) {
      return customScaffoldMessenger('Erro inesperado!');
    } else if (data == 404) {
      return customScaffoldMessenger('Nenhum personagem foi encontrado!');
    } else {
      return customScaffoldMessenger('Erro ${data.statusCode}: ${data.body}');
    }
  }
}

customScaffoldMessenger(message) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: error_color,
      content: Text(message, style: body_white_14_700),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
          textColor: white_color,
          label: 'FECHAR',
          onPressed: () => ScaffoldMessenger.of(Get.context!).clearSnackBars()),
    ),
  );
}
