import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/app_routes.dart';

///Componente visual
/*
CategoryItem é o componente visual que utilizamos pra transformar via map,
os elementos do modelo em elementos visuais
*/
class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      //Bordas arredondadas para ficarem proporcionais as do Container
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color,
              category.color.withOpacity(0.5),
            ],
/*    Lista de cores com a cor que recebemos e uma variação da mesma
        com opacidade aplicada
*/
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Text(
          category.title,
          style: const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20),
        ),
      ),
    );
  }
}
