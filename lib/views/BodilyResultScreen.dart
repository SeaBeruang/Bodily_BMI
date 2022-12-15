import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:bodily_bmi_calculator/helper/helper.dart';

class BodilyResultScreen extends StatelessWidget {
  final ResultModel;
  final bmi;
  final status;
  final indicator;
  final name;
  final gender;

  BodilyResultScreen({
    this.ResultModel,
    this.bmi,
    this.indicator,
    this.status,
    this.name,
    this.gender
  });

  @override
  Widget build(BuildContext context) {
    String descriptions = Descriptions(this.status);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${this.name}'s BMI results",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "${this.indicator}",
                    height: 170
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SfLinearGauge(
                    minimum: 0,
                    maximum: 40,
                    ranges: [
                      LinearGaugeRange( startValue: 0, endValue: 18.5, color: Colors.deepPurpleAccent),
                      LinearGaugeRange( startValue: 18.5, endValue: 22.9, color: Colors.lightBlueAccent),
                      LinearGaugeRange( startValue: 23, endValue: 29.9, color: Colors.orangeAccent),
                      LinearGaugeRange( startValue: 30, endValue: 50, color: Colors.redAccent)
                    ],
                    markerPointers: [
                      LinearShapePointer(
                        value: this.bmi
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Gender: ${this.gender}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "BMI : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "${this.bmi}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text("You're ${this.status}.",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                          )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "${descriptions}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ZoomTapAnimation(child:
                  Container(
                    width: 200,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Navigasi balik ke halaman awal
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Go back 🏡",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
