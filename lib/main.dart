import 'package:flutter/material.dart';
import 'providers/themeVN.dart';
import 'providers/changeTextColor.dart';
import 'package:provider/provider.dart';
import 'providers/timerProvider.dart';

final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);

void main() {
  runApp(ValueListenableProvider.value(value: isDarkMode, child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int index = 0;

  void onTapIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: IndexedStack(
          index: index,
          children: [
            ChangeTheme(context),
            ChangeTextColor(context),
            TimerPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: onTapIndex,
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
              label: "Change text color",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Timer"),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "To-Do list",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_alt),
              label: "NotesModel",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite goods",
            ),
          ],
        ),
      ),
    );
  }
}
