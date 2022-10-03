import 'package:flutter/material.dart';

abstract class VerifyError {
  static verify(data) {
    if (data.runtimeType ==
        ScaffoldFeatureController<SnackBar, SnackBarClosedReason>) {
      return true;
    } else {
      return false;
    }
  }
}
