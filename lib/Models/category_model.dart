// To parse this JSON data, do
//
//     final categorymodel = categorymodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Categorymodel categorymodelFromJson(String str) =>
    Categorymodel.fromJson(json.decode(str));

class Categorymodel {
  List<Category> categories;

  Categorymodel({
    required this.categories,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) => Categorymodel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );
}

class Category {
  String name;
  List<String> subcategory;
 

  Category({
    required this.name,
    required this.subcategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subcategory: List<String>.from(json["subcategory"].map((x) => x)),
      );

}
