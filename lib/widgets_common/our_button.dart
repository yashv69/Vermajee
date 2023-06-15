import 'package:Vermajee/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, Color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: Color, padding: const EdgeInsets.all(12)),
    onPressed: onPress,
    child: title!.text.color(whiteColor).fontFamily(bold).make(),
  );
}
