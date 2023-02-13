import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CalcBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalcBody extends StatefulWidget {
  @override
  _CalcBodyState createState() => _CalcBodyState();
}


class _CalcBodyState extends State<CalcBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                FunkctionButton("C"),
                FunkctionButton("⌫"),
                FunkctionButton("%"),
                FunkctionButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                NumberButton("7"),
                NumberButton("8"),
                NumberButton("9"),
                FunkctionButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                NumberButton("4"),
                NumberButton("5"),
                NumberButton("6"),
                FunkctionButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                NumberButton("1"),
                NumberButton("2"),
                NumberButton("3"),
                FunkctionButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                FunkctionButton("."),
                NumberButton("0"),
                NumberButton("00"),
                FunkctionButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget FunkctionButton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: const TextStyle(fontSize: 35.0, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget NumberButton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: const TextStyle(fontSize: 35.0, color: Colors.white),
        ),
      ),
    );
  }

  String text = "0";
  String result = "0";
  String expression = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = "";

  void btnClicked(String val) {
    if (val == "C") {
      text = "0";
      result = "0";
      expression = "";
      num1 = 0.0;
      num2 = 0.0;
      operation = "";
    } else if (val == "⌫") {
      text = text.substring(0, text.length - 1);
      if (text == "") {
        text = "0";
      }
    } else if (val == "+" ||
        val == "-" ||
        val == "x" ||
        val == "/" ||
        val == "%") {
      num1 = double.parse(text);
      operation = val;
      expression = text + operation;
      text = "0";
    } else if (val == "=") {
      num2 = double.parse(text);
      if (operation == "+") {
        result = (num1 + num2).toString();
      }
      if (operation == "-") {
        result = (num1 - num2).toString();
      }
      if (operation == "x") {
        result = (num1 * num2).toString();
      }
      if (operation == "/") {
        result = (num1 / num2).toString();
      }
      if (operation == "%") {
        result = (num1 / 100 * num2).toString();
      }
      expression = "";
      text = result;
    } else {
      if (text == "0") {
        text = val;
      } else {
        text = text + val;
      }
    }
    setState(() {});
  }
}