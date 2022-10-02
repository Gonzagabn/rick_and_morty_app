// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

//translucid_blue_box_decoration
final translucid_blue_box_decoration = BoxDecoration(
  color: bg_blue_color.withOpacity(0.80),
  borderRadius: BorderRadius.circular(16.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.064),
      blurRadius: 3.2,
      spreadRadius: 1.6,
    )
  ],
);
