
///Modelo da informação que vamos trabalhar para os filtros da Tela de Configurações
/*
Neste model irá constar as informações que iremos trabalhar referente aos
filtros para tela de configurações.
Todos esses atributos são booleans que representam a possibilidade de
uma comida específica apresentar determinada característica ou não.
 */
class Settings {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  Settings({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}