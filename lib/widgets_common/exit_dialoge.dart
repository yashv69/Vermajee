import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget exitdialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit"
            .text
            .size(16)
            .color(darkFontGrey)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                Color: Colors.black87,
                onPress: () {
                  SystemNavigator.pop();
                },
                textColor: whiteColor,
                title: "Yes"),
            ourButton(
                Color: Colors.black87,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: "No"),
          ],
        ),
      ],
    ).color(lightGrey).box.padding(const EdgeInsets.all(12)).roundedSM.make(),
  );
}
