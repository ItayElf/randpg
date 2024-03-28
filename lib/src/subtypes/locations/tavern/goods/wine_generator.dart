import 'dart:math';

import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import 'tavern_goods_data.dart';

/// A class that generates wine goods
class WineGenerator implements Generator<Goods> {
  late int _seed;

  static const _wineDescriptions = 2;

  WineGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  Goods generate() {
    final wineColorGenerator = ListItemGenerator(["red", "white"]);
    wineColorGenerator.seed(_seed);
    final wineColor = wineColorGenerator.generate();

    final generator = BatchGenerator(_getBatch(wineColor));
    generator.seed(_seed);
    final result = generator.generate();

    final name =
        "${result["namePrefix"]} ${result["nameSuffix"]} ${result["type"]}";
    final description =
        "a${result["origin"]} $wineColor wine ${result["bouquet"]}"
        " ${result["descriptions"].join(" and ")}";

    final cost = _getCost(result["origin"]);

    return Goods(name: name, description: description, price: "$cost sp");
  }

  int _getCost(String origin) {
    final baseCost = tavernWineOrigin[origin] ?? 0;
    final multiplier = Random(_seed).nextDouble() + 0.5;

    return max((baseCost * multiplier).toInt(), 1);
  }

  Map<String, Generator> _getBatch(String wineColor) => {
        "type": ListItemGenerator(
          wineColor == "red" ? tavernRedWineTypes : tavernWhiteWineTypes,
        ),
        "origin": ListItemGenerator(tavernWineOrigin.keys.toList()),
        "namePrefix": ListItemGenerator(tavernBeverageNamePrefix),
        "nameSuffix": ListItemGenerator(tavernBeverageNameSuffix),
        "bouquet": ListItemGenerator(tavernWineBouquet),
        "descriptions": UniqueGenerator(
          ListItemGenerator(tavernWineDescription),
          _wineDescriptions,
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
