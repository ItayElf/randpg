import 'dart:math';

import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import 'tavern_goods_data.dart';

/// A class that generates meals
class MealGenerator implements Generator<Goods> {
  late int _seed;

  MealGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  Goods generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    final results = generator.generate();

    final name = "${results["cooking"]} ${results["meat"]}";

    final description =
        "${results["cooking"]} ${results["meat"]} ${results["sauce"]} "
        "${results["presentation"]} ${results["side"]}";

    final cost = _getCost(results["meat"]);
    return Goods(name: name, description: description, price: "$cost gp");
  }

  int _getCost(String meat) {
    final baseCost = tavernMeats[meat] ?? 0;
    final multiplier = Random(_seed).nextDouble() + 0.5;

    return max((baseCost * multiplier).toInt(), 1);
  }

  Map<String, Generator> _getBatch() => {
        "meat": ListItemGenerator(tavernMeats.keys.toList()),
        "cooking": ListItemGenerator(tavernCookingMethods),
        "sauce": ListItemGenerator(tavernFoodSauce),
        "presentation": ListItemGenerator(tavernFoodPresentation),
        "side": ListItemGenerator(tavernFoodSide)
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
