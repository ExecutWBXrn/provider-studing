import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer"), centerTitle: true),
      body: ChangeNotifierProvider<TimerRunner>(
        create: (context) => TimerRunner(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              TextTimer(),
              Row(
                spacing: 40,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [StartButton(), StopButton()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pSec = context.watch<TimerRunner>();

    int hour = ((pSec.passedTime / (60 * 60)).floor()) % 24;
    int minutes = ((pSec.passedTime / 60).floor()) % 60;
    int second = pSec.passedTime % 60;

    return Text(
      "${hour < 10 ? "0" : ""}$hour:${minutes < 10 ? "0" : ""}$minutes:${second < 10 ? "0" : ""}$second",
      style: TextStyle(fontSize: 30),
    );
  }
}

class StartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pSec = context.read<TimerRunner>();
    return IconButton(
      onPressed: () {
        pSec.start();
      },
      icon: Icon(Icons.start, size: 40, color: Colors.green),
    );
  }
}

class StopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pSec = context.read<TimerRunner>();
    return IconButton(
      onPressed: () {
        pSec.stop();
      },
      icon: Icon(Icons.stop_circle_outlined, size: 40, color: Colors.red),
    );
  }
}

class TimerRunner extends ChangeNotifier {
  int _passedTime = 4000;
  Timer? myTimer;

  int get passedTime => _passedTime;

  void start() {
    myTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _passedTime++;
      notifyListeners();
    });
  }

  void stop() {
    myTimer?.cancel();
    notifyListeners();
  }
}
