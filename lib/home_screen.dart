import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/app_button_widget.dart';
import 'widgets/plus_minus_button_widget.dart';
import 'widgets/section_label_widget.dart';
import 'widgets/value_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 0;
  int weight = 0;
  double height = 70;
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0F21),
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.black,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.0),

            /// 1ST ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// MALE
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Male";
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.42,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          gender == "Male"
                              ? Color(0xFF111328)
                              : Color(0xFF1D1E33),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.male, color: Colors.white, size: 60),
                        SectionLabelWidget(
                          sectionHeader: "MALE",
                          textColor: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ),
                ),

                /// FEMALE
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Female";
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.42,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          gender == "Female"
                              ? Color(0xFF111328)
                              : Color(0xFF1D1E33),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.female, color: Colors.white, size: 60),
                        SectionLabelWidget(
                          sectionHeader: "FEMALE",
                          textColor: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.0),

            /// 2nd ITEM
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.22,
              margin: EdgeInsets.only(left: 17.0, right: 17.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF1D1E33),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SectionLabelWidget(sectionHeader: "HEIGHT"),
                  ValueWidget(value: height.toStringAsFixed(0)),
                  Slider(
                    value: height,
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                    divisions: 210,
                    thumbColor: Color(0xFFE83D66),
                    activeColor: Color(0xFFE83D66),
                    inactiveColor: Color(0xFF8D8E98),
                    min: 62,
                    max: 272,
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.0),

            /// 3rd ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// WEIGHT CONTAINER
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.42,
                  height: MediaQuery.sizeOf(context).height * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF1D1E33),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SectionLabelWidget(sectionHeader: "WEIGHT"),
                      ValueWidget(value: weight.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PlusMinusButtonWidget(
                            iconData: Icons.add,
                            onButtonClicked: () {
                              setState(() {
                                if (weight < 400) {
                                  weight = weight + 1;
                                }
                              });
                            },
                          ),
                          PlusMinusButtonWidget(
                            iconData: Icons.remove,
                            onButtonClicked: () {
                              setState(() {
                                if (weight > 0) {
                                  weight = weight - 1;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// AGE
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.42,
                  height: MediaQuery.sizeOf(context).height * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF1D1E33),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SectionLabelWidget(sectionHeader: 'AGE'),
                      ValueWidget(value: age.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PlusMinusButtonWidget(
                            iconData: Icons.add,
                            onButtonClicked: () {
                              setState(() {
                                if (age < 120) {
                                  age = age + 1;
                                }
                              });
                            },
                          ),
                          PlusMinusButtonWidget(
                            iconData: Icons.remove,
                            onButtonClicked: () {
                              setState(() {
                                if (age > 0) {
                                  age = age - 1;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// 4th BUTTON
            AppButtonWidget(
              buttonLabel: "CALCULATE",
              onClick: () {
                double meter = height / 100;
                double bmi = weight / (meter * 2);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmiResult: bmi),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
