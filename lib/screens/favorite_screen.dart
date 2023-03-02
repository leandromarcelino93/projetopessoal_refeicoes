import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

///Tela para exibir as refeições favoritadas

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(widget.favoriteMeals[index]);
        },
      );
    }
  }
}
