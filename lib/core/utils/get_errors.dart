import 'package:rick_and_morty_app/core/utils/app_error.dart';

abstract class VerifyError {
  static verify(data) {
    if (data.runtimeType == AppError) {
      return true;
    } else
      return false;
  }
}
