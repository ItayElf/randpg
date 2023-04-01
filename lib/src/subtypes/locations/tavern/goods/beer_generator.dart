import 'dart:math';

import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import 'tavern_goods_data.dart';

/// A class that generates beers
class BeerGenerator implements IGenerator<Goods> {
  late int _seed;

  BeerGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  Goods generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    final results = generator.generate();

    final name =
        "${results["namePrefix"]} ${results["nameSuffix"]} ${results["type"]}";

    final description = "a${results["origin"]} ${results["type"]}. "
        "often described as a${results["flavour"]} ${results["type"]} with a ${results["finish"]} finish";

    final cost = _getCost(results["origin"]);
    return Goods(name: name, description: description, price: "$cost cp");
  }

  double _getCost(String origin) {
    final baseCost = tavernBeerOrigin[origin] ?? 0;
    final multiplier = Random(_seed).nextDouble() + 0.5;

    return ((baseCost * multiplier) * 10).toInt() / 10;
  }

  Map<String, IGenerator> _getBatch() => {
        "namePrefix": ListItemGenerator(tavernBeverageNamePrefix),
        "nameSuffix": ListItemGenerator(tavernBeverageNameSuffix),
        "type": ListItemGenerator(tavernBeerType),
        "origin": ListItemGenerator(tavernBeerOrigin.keys.toList()),
        "flavour": ListItemGenerator(tavernBeerFlavor),
        "finish": ListItemGenerator(tavernBeerFinish),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
