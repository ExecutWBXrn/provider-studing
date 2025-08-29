import 'package:flutter/material.dart';
import 'providers/themeVN.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(index: 0, children: [ChangeTheme()]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: null,
          fixedColor: Colors.blue,
          backgroundColor: Colors.blueGrey,
          unselectedItemColor: Colors.blueGrey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens),
              label: "Change Theme",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked),
              label: "Change Button color",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Timer"),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "To-Do list",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked),
              label: "NotesModel",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked),
              label: "Favorite goods",
            ),
          ],
        ),
      ),
    );
  }
}
