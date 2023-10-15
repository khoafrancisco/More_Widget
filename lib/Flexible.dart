import 'package:flutter/material.dart';

class FlexibleWidget extends StatefulWidget{
  @override
  _FlexibleWidgetState createState() => _FlexibleWidgetState();
}

class _FlexibleWidgetState extends State<FlexibleWidget>{
  bool topTightFit = false;
  bool botExpaned = false;
  toggleTop(){
    setState(() {
      topTightFit = !topTightFit;
    });
  }
  toggleBot(){
    setState(() {
      botExpaned = ! botExpaned;
    });
  }
  Container topCon = Container(
    constraints: BoxConstraints(minHeight: 100.0, maxHeight: 150.0),
    child: Text("Top Container"),
    decoration: BoxDecoration(border: Border.all(width: 5.0, color: Colors.red), color: Colors.yellow),
  );
  Container botCon = Container(
    constraints: BoxConstraints(minHeight: 100.0, maxHeight: 150.0),
    child: Text("Bottom Container"),
    decoration: BoxDecoration(border: Border.all(width: 5.0, color: Colors.red), color: Colors.green),
  );
  @override
  Widget build(BuildContext context){
    Widget topWidget = Flexible(
        child: topCon,
        fit: topTightFit ? FlexFit.tight: FlexFit.loose);
    Widget botWidget = botExpaned ? Expanded(child: botCon):botCon;
    String toolbarTop = "Top " + (topTightFit ? "tight ": "loose");
    String toolbarBot = "Bottom " + (botExpaned ? "expened ": "not");
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible widget"),
        actions: [
          TextButton.icon(
              icon: Icon(topTightFit ? Icons.arrow_upward : Icons.arrow_downward, size: 15, color: Colors.black),
              label: Text(toolbarTop, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)), onPressed: () =>{toggleTop()}
          ),
          TextButton.icon(
              icon: Icon(botExpaned ? Icons.arrow_downward : Icons.arrow_upward, size: 15, color: Colors.black),
              label: Text(toolbarBot,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)), onPressed: () =>{toggleBot()}
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [topWidget, botWidget],
        ),
      ),
    );
  }
}