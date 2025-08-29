import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget ChangeTextColor(BuildContext context) {
  final colorNotifier = ValueNotifier<Color>(Colors.green);
  return Scaffold(
    appBar: AppBar(title: Text("Change text color"), centerTitle: true),
    body: ValueListenableProvider.value(
      value: colorNotifier,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<Color>(
              valueListenable: colorNotifier,
              builder: (context, currentColor, child) {
                return Text(
                  "Text that change color",
                  style: TextStyle(fontSize: 30, color: currentColor),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColorButton(
                  color: Colors.green,
                  notifierToUpdate: colorNotifier,
                ),
                ColorButton(
                  color: Colors.yellow,
                  notifierToUpdate: colorNotifier,
                ),
                ColorButton(color: Colors.red, notifierToUpdate: colorNotifier),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class ColorButton extends StatelessWidget {
  final Color color;
  final ValueNotifier<Color> notifierToUpdate;

  ColorButton({required this.color, required this.notifierToUpdate});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        notifierToUpdate.value = color;
      },
      child: Container(width: 80, height: 80, color: color),
    );
  }
}
