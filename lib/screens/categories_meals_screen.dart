import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

///Tela referente a category_item
  class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    /* Através dessa variável estamos recebendo as informações de category
    via arguments lá de category item e utilizando cast para converter isso
    para uma classe do tipo category
     */
    final categoryMeals = meals.where((meal){
      return meal.categories.contains(category.id);
    /* Importante: Oq estamos fazendo com o where aqui é filtrar
    entre as refeições quais pertencem a cada categoria.
    Isto é feito através do id,
    se a refeição contém o id de determinada categoria, então ela
    fará parte da lista daquela categoria. Caso não tenha nenhum id
    em seu categories, ela não fará parte de nenhuma lista então.
     */
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index)
        {
          return MealItem(categoryMeals[index]);
          /*
          Já estamos passando todas as informações necessárias
          das refeições via parâmetro.
          */
        }
      ),
    );
  }
}
