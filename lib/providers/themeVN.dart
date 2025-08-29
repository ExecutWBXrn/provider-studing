import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/main.dart';

Widget ChangeTheme(BuildContext context) {
  final bool _themeMode = context.watch<bool>();
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: _themeMode,
          onChanged: (_) => {isDarkMode.value = !isDarkMode.value},
        ),
      ],
    ),
  );
}
