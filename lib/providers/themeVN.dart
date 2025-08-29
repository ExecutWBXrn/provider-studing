import 'package:flutter/material.dart';

Widget ChangeTheme() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Switch(value: false, onChanged: null)],
    ),
  );
}
