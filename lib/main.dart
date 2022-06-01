import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = "";
  double num1 = 0;

  String opr = '+';
  double result = 0;

  void changeNum(String btntxt) {
    setState(() {
      if (btntxt == 'AC') {
        text = "";
        num1 = 0;
        result = 0;
        opr = '+';
      } else if ('+-x/%'.contains(btntxt)) {
        calculate();
        text = '';
        opr = btntxt;
      } else if (btntxt == '=') {
        calculate();
        opr = '+';
        num1 = 0;
        text = result.toStringAsFixed(5);
        result = 0;
      } else {
        text += btntxt;
      }
    });
  }

  void calculate() {
    num1 = double.tryParse(text) ?? 0;
    switch (opr) {
      case '+':
        result += num1;
        break;
      case '-':
        result -= num1;
        break;
      case '/':
        result /= num1;
        break;
      case 'x':
        result *= num1;
        break;
      case '%':
        result *= num1;
        result /= 100;
        break;
    }
  }

  ElevatedButton button(String btntxt, Color btncolor) {
    return ElevatedButton(
      onPressed: () => changeNum(btntxt),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: btncolor,
          padding: const EdgeInsets.all(20)),
      child: Text(
        btntxt,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("AC", Colors.black),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    text = text.substring(0, text.length - 1);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Colors.black,
                    padding: const EdgeInsets.all(20)),
                child: const Icon(
                  Icons.backspace,
                  size: 35,
                ),
              ),
              button("%", Colors.black),
              button("/", const Color.fromARGB(255, 59, 58, 58)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("7", Colors.black),
              button("8", Colors.black),
              button("9", Colors.black),
              button("x", const Color.fromARGB(255, 59, 58, 58)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("4", Colors.black),
              button("5", Colors.black),
              button("6", Colors.black),
              button("-", const Color.fromARGB(255, 59, 58, 58)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("1", Colors.black),
              button("2", Colors.black),
              button("3", Colors.black),
              button("+", const Color.fromARGB(255, 59, 58, 58)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  changeNum('0');
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Colors.black,
                  padding: const EdgeInsets.fromLTRB(34, 20, 110, 20),
                ),
                child: const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
              button(".", Colors.black),
              button("=", Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
