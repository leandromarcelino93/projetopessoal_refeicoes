import '../models/settings.dart';
import 'package:flutter/material.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import '../screens/settings_screen.dart';
import './screens/tabs_screen.dart';
import './utils/app_routes.dart';
import './models/meal.dart';
import './data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ///Variável que detém o Estado das configurações setadas
  Settings settings = Settings();

  ///Lista que faz parte do estado do componente
  List<Meal> _availableMeals = DUMMY_MEALS;

  final List<Meal> _favoriteMeals = [];

  ///Função que detém a lógica que é empregada no filtro de Configurações
  void _filterMeals (Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal){
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;

      }).toList();
    });
  }

  ///Função que detém a lógica que é empregada para favoritar as refeições
  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  ///Função que detém a lógica que é empregada na animação do botão de favoritar
  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.red,),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            fontSize: 20,
            //fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        ///Rotas nomeadas e as comunicações com as telas através de seus construtores
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
