import 'package:flutter/material.dart';

///Modelo da informação que vamos trabalhar para as Categorias
class Category {
  final String id;
  final String title;
  final Color color ;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
