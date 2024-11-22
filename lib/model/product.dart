import 'package:flutter/material.dart';

class Product {
  String name;
  int price;
  String contents;
  List<String> image;

  Product({
    required this.name,
    required this.price,
    required this.contents,
    required this.image,
  });
}
