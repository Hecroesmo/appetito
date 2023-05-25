import '../models/food_plate.dart';

class FoodPlateService {
  List<FoodPlate> getFoodPlateList() {
    // Simulating data retrieval from a service or database
    // In this example, we are returning a hardcoded list of FoodPlate

    List<FoodPlate> foods = [
      FoodPlate('Peito Alto', 'Funge ou arroz com feijão ou kizaca & Banana', 1500.0, 1, 'peito alto'),
      FoodPlate('Carne de Porco', 'Funge ou arroz com feijão ou kizaca & Saladas de frutas', 2000.0, 1, 'carne de porco'),
      FoodPlate('Bifana', 'Arroz com batatas fritas, Salada & Banana', 1500.0, 1, 'bifana'),
      FoodPlate('Churrasco', 'Funge ou arroz com Feijão ou kizaca & Banana', 2000.0, 1, 'churrasco'),
    ];

    return foods;
  }
}