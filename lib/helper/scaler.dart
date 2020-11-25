import 'package:flutter/material.dart';

class Scaler {
  num shortSide;
  Scaler(BuildContext context) {
    shortSide = MediaQuery.of(context).size.shortestSide;
  }
  num sp(double percentage) {
    return ((shortSide) * (percentage / 1000)).ceil().toDouble();
  }
}
