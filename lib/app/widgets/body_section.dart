import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class BodySectionWidget extends StatelessWidget {
  final GetxController controller;
  final Widget? child;

  const BodySectionWidget({
    required this.controller,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 48.0,
      bottom: 0.0,
      child: Container(
        color: white_color,
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 12.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
