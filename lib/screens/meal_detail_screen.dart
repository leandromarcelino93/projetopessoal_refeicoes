import 'package:flutter/material.dart';
import '../models/meal.dart';

///Tela referente a meal_item
class MealDetailScreen extends StatelessWidget {

  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorited;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorited, {super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  ///Função criada para agilizar a criação dos títulos

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 300,
      height: 230,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        //SingleChildScrollView para rolarmos a tela
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                      /*Os ingredientes estão presentes dentro de uma lista,
                      conforme visto em dummy_data, por isso precisamos
                      utilizar o index, para trazer todos os itens dela
                       */
                    ),
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passo-a-Passo'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorited(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          onToggleFavorite(meal);
          /* Sempre que o usuário clicar nesse botão,
          haverá uma alternância: quando ele clicar uma vez,
          vai para a lista de favoritos. Quando ele clicar outra,
          aí sai da lista. E assim vai, graças a lógica implementada
          no método toggleFavorite lá na raíz do projeto (MyApp).
          */
        },
      ),
    );
  }
}
