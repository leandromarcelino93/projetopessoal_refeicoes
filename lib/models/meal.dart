import 'package:flutter/material.dart';

///Modelo da informação que vamos trabalhar para as Refeições
/* Esse novo modelo foi criado para trabalhar com as refeições
que estarão presentes dentro das categorias. Percebo a importância
de criar esses modelos por causa dos id's. Através deles que
foi possível "amarrar" uma refeição com uma categoria, por exemplo.
 */

///Graduações
enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Justo';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }

///Guetter para retornar valor textual associado a cada um dos níveis de complexidade
  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Normal';
      case Complexity.difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }
}
