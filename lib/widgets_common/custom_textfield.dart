import 'package:Vermajee/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.black87).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
          obscureText: isPass,
          controller: controller,
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                fontFamily: semibold,
                color: textfieldGrey,
              ),
              hintText: hint,
              isDense: true,
              fillColor: lightGrey,
              filled: true,
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: redColor)))),
    ],
  );
}
