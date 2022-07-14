// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';

double bmiresult = 0;
void calculateBmi(
    TextEditingController _weight, String heightinFeet, String heightinInch) {
  double weight = double.parse(_weight.text);
  double heightFeet = double.parse(heightinFeet);
  double heightInch = double.parse(heightinInch);

  heightFeet = (heightFeet * 3) / 10;
  heightInch = (heightInch * 25) / 1000;
  double heightInMeters = heightFeet + heightInch;
  heightInMeters = heightInMeters * heightInMeters;
  bmiresult = weight / (heightInMeters);
}

String getResult(bmiresult) {
  if (bmiresult >= 25) {
    return 'Overweight';
  } else if (bmiresult >= 18.5) {
    return 'Normal';
  } else {
    return 'Underweight';
  }
}

String bmiTextResult = getResult(bmiresult);



























// class CalculatorBrain {
//   CalculatorBrain(this.weight, this.heightFeet, this.heightInch);
//   late dynamic heightFeet;
//   late dynamic heightInMeters;
//   late dynamic heightInch;
//   late dynamic weight;
//   late double bmiresult;
//   late double result;

//   dynamic calculateBMI() {
//     heightFeet = (heightFeet * 3) / 10;
//     heightInch = (heightInch * 25) / 1000;
//     heightInMeters = heightFeet + heightInch;
//     heightInMeters = heightInMeters * heightInMeters;
//     bmiresult = weight / (heightInMeters);
//     return bmiresult.toStringAsFixed(1);
//   }

//   double resultView() {
//     result = bmiresult;
//     return result;
//   }

//  