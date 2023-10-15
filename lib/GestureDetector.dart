import 'package:flutter/material.dart';

class GuestureWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GuestureWidgetState();
  }
}

class _GuestureWidgetState extends State<GuestureWidget> {
  String log = "";
  void clear() {
    setState(() {
      log = '';
    });
  }
  void logGesture(String logMsg) {
    setState(() {
      log += "\n";
      log += logMsg;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gesture Widget")),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0),
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Gesture Detector"),
                  ),
                  width: 200,
                  height: 200),
              onTap: () => {logGesture("on Tab")},
              onDoubleTap: () {
                logGesture("on Double tab");
              },
              onTapDown: (detail) =>
              {logGesture("tab ${detail.localPosition}")},
              onLongPress: () {
                logGesture("long press");
              },
            ),
            Container(
              child: Text(log),
            ),
            ElevatedButton(onPressed: () => {clear()}, child: Text("Clear"))
          ],
        ),
      ),
    );
  }
}