import 'package:bmi_calculator1/data.dart';
import 'package:flutter/material.dart';

// Helper function for text
Widget addText(double size, Color color, FontWeight weight, TextAlign align, String text) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
    ),
  );
}

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // Calculate BMI using variables from data.dart
  double calculateBMI() {
    double heightInMeters = heightValue / 100;
    return weightVal / (heightInMeters * heightInMeters);
  }

  String getResultText(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color getResultColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String bmiString = bmi.toStringAsFixed(1);
    String resultText = getResultText(bmi);
    Color resultColor = getResultColor(bmi);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.orange,
        title: const Text(
          'BMI Result',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addText(30, Colors.white, FontWeight.w900, TextAlign.center, 'Your Result'),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.orange, width: 3),
                ),
                child: Column(
                  children: [
                    addText(22, resultColor, FontWeight.w900, TextAlign.center, resultText),
                    const SizedBox(height: 20),
                    addText(60, Colors.white, FontWeight.w900, TextAlign.center, bmiString),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: addText(20, Colors.white, FontWeight.w900, TextAlign.center, 'RE-CALCULATE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}