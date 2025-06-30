import 'package:bmi_calculator/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.bmiResult});

  final double bmiResult;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    print("${widget.bmiResult}");

    return Scaffold(
      backgroundColor: Color(0xFF0A0F21),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                width: MediaQuery.sizeOf(context).width * 0.99,
                color: Color(0xFF1D1E33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "OVERWEIGHT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      widget.bmiResult.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "You have higher than normal weight. \nPlease exercise more often.",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            /// RECALCULATE
            AppButtonWidget(
              onClick: () {
                Navigator.pop(context);
              },
              buttonLabel: "RE-CALCULATE",
            ),
          ],
        ),
      ),
    );
  }
}
