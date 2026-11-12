import 'package:bmi_calculator1/result_page.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class Input extends StatefulWidget {
  const new({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.orange,
          title: Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight(1000),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            gender = 1;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: gender == 1 ?Colors.orange : Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, color: Colors.white, size: 50),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight(1000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            gender = 2;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: gender == 2? Colors.orange : Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, color: Colors.white, size: 50),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight(1000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 3),
                          ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight(1000),
                          ),
                        ),
                        Text(
                          '$heightValue cm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight(1000),
                          ),
                        ),
                        Slider(
                          value: heightValue.toDouble(),
                          min: 100,
                          max: 230,
                          activeColor: Colors.orange,
                          inactiveColor: Colors.white,
                          onChanged: (double newValue) {
                            setState(() {
                              heightValue = newValue.toInt();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight(1000),
                                ),
                              ),
                    
                              Text(
                                '$weightVal kg',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight(1000),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.small(
                                    backgroundColor: Colors.orange,
                                    onPressed: () {
                                  setState(() {
                                    weightVal++;
                                  });
                                },
                                heroTag: 'btn1',
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  FloatingActionButton.small(
                                    backgroundColor: Colors.orange,
                                    onPressed: () {
                                  setState(() {
                                    if (weightVal>10){
                                      weightVal--;
                                    }
                                  });
                                },
                                heroTag: 'btn2',
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight(1000),
                                ),
                              ),
                    
                              Text(
                                '$ageVal Years',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight(1000),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.small(
                                    backgroundColor: Colors.orange,
                                    onPressed: () {
                                  setState(() {
                                    ageVal++;
                                  });
                                },
                                heroTag: 'btn3',
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  FloatingActionButton.small(
                                    backgroundColor: Colors.orange,
                                    onPressed: () {
                                  setState(() {
                                    if (ageVal > 1){
                                      ageVal--;
                                    }
                                  });
                                },
                                heroTag: 'btn4',
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                height: 70.0,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(45.0),
                    bottomRight: Radius.circular(45.0),
                  )
                ),
                 child: TextButton(
                  onPressed: () {

                    

                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => const Result())
                      );
                  },
                  child: Text('Calculate BMI',
                                style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight(1000),
                                ),
                  ),
                ),
              ),
            ],

          ),
        ),
      );
  }
}