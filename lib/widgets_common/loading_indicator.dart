import 'package:Vermajee/consts/consts.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.black87),
  );
}
