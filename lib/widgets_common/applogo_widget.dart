import 'package:Vermajee/consts/consts.dart';
import 'package:flutter/material.dart';

Widget applogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .size(150, 150)
      .padding(const EdgeInsets.all(10))
      .make();
}

Widget applogoWidget2() {
  return Image.asset(icAppLogo2)
      .box
      .roundedFull
      .size(150, 150)
      .padding(const EdgeInsets.all(10))
      .make();
}
