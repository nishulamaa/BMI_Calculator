
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int heightVal = 150;
  int weightVal = 62;
  int ageVal = 20;

  String gender = '';

  double calculateBMI() {
    double heightInMeters = heightVal / 100;
    return weightVal / (heightInMeters * heightInMeters);
  }

  void showBMIResult() {
    if (gender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your gender'),
        ),
      );
      return;
    }

    double bmi = calculateBMI();

    String result;

    if (bmi < 18.5) {
      result = 'Underweight';
    } else if (bmi < 25) {
      result = 'Normal weight';
    } else if (bmi < 30) {
      result = 'Overweight';
    } else {
      result = 'Obese';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'BMI Result',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                result,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.orange,
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 20),

              const Text(
                'Gender',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // GENDER SELECTION

              Row(
                children: [

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'Male';
                        });
                      },
                      child: Container(
                        height: 160,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: gender == 'Male'
                              ? Colors.orange
                              : Colors.teal,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Male',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'Female';
                        });
                      },
                      child: Container(
                        height: 160,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: gender == 'Female'
                              ? Colors.orange
                              : Colors.teal,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              // HEIGHT

              Container(
                height: 180,
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      'Height',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '$heightVal cm',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Slider(
                      value: heightVal.toDouble(),
                      min: 100,
                      max: 220,
                      activeColor: Colors.orange,
                      onChanged: (double newVal) {
                        setState(() {
                          heightVal = newVal.round();
                        });
                      },
                    ),

                  ],
                ),
              ),

              // WEIGHT AND AGE

              Row(
                children: [

                  // WEIGHT

                  Expanded(
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Text(
                            'Weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            '$weightVal kg',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              FloatingActionButton.small(
                                heroTag: 'weightMinus',
                                backgroundColor: Colors.orange,
                                onPressed: () {
                                  setState(() {
                                    if (weightVal > 1) {
                                      weightVal--;
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),

                              const SizedBox(width: 10),

                              FloatingActionButton.small(
                                heroTag: 'weightPlus',
                                backgroundColor: Colors.orange,
                                onPressed: () {
                                  setState(() {
                                    weightVal++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                  // AGE

                  Expanded(
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Text(
                            'Age',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            '$ageVal years',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              FloatingActionButton.small(
                                heroTag: 'ageMinus',
                                backgroundColor: Colors.orange,
                                onPressed: () {
                                  setState(() {
                                    if (ageVal > 1) {
                                      ageVal--;
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),

                              const SizedBox(width: 10),

                              FloatingActionButton.small(
                                heroTag: 'agePlus',
                                backgroundColor: Colors.orange,
                                onPressed: () {
                                  setState(() {
                                    ageVal++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),   

              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: showBMIResult,

                  child: const Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}