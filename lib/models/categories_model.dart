import 'package:flutter/material.dart';

class CategoriesModel {
  const CategoriesModel({
    this.color = Colors.orange,
    required this.id,
    required this.title,
  });
  final String id;
  final String title;
  final Color color;
}
