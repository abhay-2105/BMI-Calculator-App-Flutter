import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int countAge = 10;
  double countWeight = 30;
  double _value = 100;
  bool maleSelected = false;
  bool femaleSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(41, 52, 98, 1),
        title: const Text("BMI CALCULATOR"),
      ),
      backgroundColor: const Color.fromRGBO(41, 52, 98, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            maleSelected = true;
                            femaleSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: maleSelected
                                  ? const Color.fromRGBO(15, 52, 96, 1)
                                  : const Color.fromARGB(255, 52, 84, 132),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          // ignore: sort_child_properties_last
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.male,
                                size: 80,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          height: (MediaQuery.of(context).size.height -
                                  AppBar().preferredSize.height) *
                              0.25,
                          width:
                              (MediaQuery.of(context).size.width - 16) / 2 - 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            maleSelected = false;
                            femaleSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: femaleSelected
                                  ? const Color.fromRGBO(15, 52, 96, 1)
                                  : const Color.fromARGB(255, 52, 84, 132),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          // ignore: sort_child_properties_last
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.female,
                                size: 80,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          height: (MediaQuery.of(context).size.height -
                                  AppBar().preferredSize.height) *
                              0.25,
                          width:
                              (MediaQuery.of(context).size.width - 16) / 2 - 15,
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    // ignore: sort_child_properties_last
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(_value.toStringAsFixed(2),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 40)),
                              const Text("cm",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ]),
                        Slider(
                            value: _value,
                            min: 50,
                            max: 200,
                            onChanged: (newval) {
                              setState(() {
                                _value = newval;
                              });
                            })
                      ],
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(15, 52, 96, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: (MediaQuery.of(context).size.height -
                            20 -
                            AppBar().preferredSize.height) *
                        0.35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(15, 52, 96, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // ignore: sort_child_properties_last
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              countWeight.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        primary: Colors.grey,
                                        shape: const CircleBorder()),
                                    onPressed: () {
                                      setState(() {
                                        if (countWeight > 0) {
                                          countWeight--;
                                        }
                                      });
                                    },
                                    child: const Text("-",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30))),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        primary: Colors.grey,
                                        shape: const CircleBorder()),
                                    onPressed: () {
                                      setState(() {
                                        countWeight++;
                                      });
                                    },
                                    child: const Text("+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30))),
                              ],
                            )
                          ],
                        ),
                        height: (MediaQuery.of(context).size.height -
                                20 -
                                AppBar().preferredSize.height) *
                            0.25,
                        width:
                            (MediaQuery.of(context).size.width - 16) / 2 - 15,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(15, 52, 96, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // ignore: sort_child_properties_last
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              countAge.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        primary: Colors.grey,
                                        shape: const CircleBorder()),
                                    onPressed: () {
                                      setState(() {
                                        if (countAge > 0) {
                                          countAge--;
                                        }
                                      });
                                    },
                                    child: const Text("-",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30))),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        primary: Colors.grey,
                                        shape: const CircleBorder()),
                                    onPressed: () {
                                      setState(() {
                                        countAge++;
                                      });
                                    },
                                    child: const Text("+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30))),
                              ],
                            )
                          ],
                        ),
                        height: (MediaQuery.of(context).size.height -
                                20 -
                                AppBar().preferredSize.height) *
                            0.25,
                        width:
                            (MediaQuery.of(context).size.width - 16) / 2 - 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            countWeight,
                            _value / 100,
                          )));
                },
                child: const Text("CALCULATE",
                    style: TextStyle(color: Colors.white, fontSize: 25))),
          )
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final double weight;
  final double height;
  ResultScreen(this.weight, this.height, {Key? key}) : super(key: key);
  final List result = ['UNDERWEIGHT', 'NORMAL', 'OVERWEIGHT', 'OBESE'];
  final List quote = [
    'OOPS! You are underweight.\n You should gain weight.',
    "You have a normal body weight.\nGood Job!",
    'OOPS! You are Overweight.\n You should loose weight.',
    'OOPS! You are in obese category.'
  ];

  String get status {
    double bmi = weight / (height * height);
    if (bmi < 18.5) {
      return result[0];
    } else if (bmi < 24.9) {
      return result[1];
    } else if (bmi < 29.9) {
      return result[2];
    }
    return result[3];
  }

  String get statement {
    double bmi = weight / (height * height);
    if (bmi < 18.5) {
      return quote[0];
    } else if (bmi < 24.9) {
      return quote[1];
    } else if (bmi < 29.9) {
      return quote[2];
    }
    return quote[3];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(41, 52, 98, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(41, 52, 98, 1),
        title: const Text("YOUR RESULT"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Container(
              color: const Color.fromARGB(255, 83, 95, 106),
              width: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(status,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  Text(
                    (weight / (height * height)).toStringAsFixed(2),
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 16,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      statement,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("RE-CALCULATE",
                    style: TextStyle(color: Colors.white, fontSize: 25))),
          )
        ],
      ),
    ));
  }
}
