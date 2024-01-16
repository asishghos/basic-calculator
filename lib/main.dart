import 'package:firstapp/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  var input = '';
  var output = '';
  var operation = '';
  onButtonClick(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "X") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userinput = input;
        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
      }
    } else {
      input = input + value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )),
          Row(
            children: [
              button(
                text: "AC",
                btnbgcolor: opColor,
                txtcolor: organgeColor,
              ),
              button(
                text: "X",
                btnbgcolor: opColor,
              ),
              button(
                text: "%",
                btnbgcolor: opColor,
              ),
              button(
                text: "/",
                btnbgcolor: opColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "7",
              ),
              button(
                text: "8",
              ),
              button(
                text: "9",
              ),
              button(
                text: "*",
                btnbgcolor: opColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "4",
              ),
              button(
                text: "5",
              ),
              button(
                text: "6",
              ),
              button(
                text: "-",
                btnbgcolor: opColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "1",
              ),
              button(
                text: "2",
              ),
              button(
                text: "3",
              ),
              button(
                text: "+",
                btnbgcolor: opColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: " ",
                btnbgcolor: Colors.transparent,
              ),
              button(
                text: "0",
              ),
              button(
                text: ".",
              ),
              button(
                text: "=",
                btnbgcolor: organgeColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget button({text, txtcolor = Colors.white, btnbgcolor = btnColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 19, color: txtcolor, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: btnbgcolor,
            padding: const EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
