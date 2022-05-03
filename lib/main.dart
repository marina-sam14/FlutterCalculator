import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a black toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String btnText) {
    //Clear calculator
    if (btnText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    //  Maths
    else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "/" ||
        btnText == "*") {
      num1 = double.parse(output);
      operand = btnText;
      _output = "0";
    } else if (btnText == ".") {
      if (_output.contains(".")) {
        print("Already contains decimals");
        return;
      } else {
        _output += btnText;
      }
    } else if (btnText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output += btnText;
    }
    print(_output);

    setState(() {
      //2 digits
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String btnText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        onPressed: () => buttonPressed(btnText),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }

  @override
  //UI
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 35.0),
          child: Text(
            output,
            style: const TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              //color: Colors.black
            ),
          ),
        ),
         const Expanded(
             child: Divider(),
         ),
        //build num
        Column(children: [
           Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/")
          ]),
           Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("*")
          ]),
           Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("-")
          ]),
           Row(children: [
            buildButton("."),
            buildButton("0"),
            buildButton("00"),
            buildButton("+")
          ]),
           Row(children: [
            buildButton("CLEAR"),
            buildButton("=")
          ]),
        ])
    ],

    ));
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
}
