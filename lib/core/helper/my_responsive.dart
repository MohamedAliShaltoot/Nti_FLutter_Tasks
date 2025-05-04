import 'package:flutter/material.dart';

abstract class MyResponsive {
  static double height(context, {required double value}) =>
      MediaQuery.of(context).size.height * (value / 812);
  static double width(context, {required double value}) =>
      MediaQuery.of(context).size.width * (value / 375);
}
