import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/multiple_generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import 'beer_generator.dart';
import 'meal_generator.dart';
import 'wine_generator.dart';

class TavernGoodsGenerator implements IGenerator<List<Goods>> {
  late int _seed;

  static const _minNumberOfDrinks = 2;
  static const _maxNumberOfDrinks = 4;
  static const _minNumberOfMeals = 0;
  static const _maxNumberOfMeals = 3;

  TavernGoodsGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Goods> generate() {
    final quantityGenerator = BatchGenerator({
      "drinks": NumberGenerator(_minNumberOfDrinks, _maxNumberOfDrinks),
      "meals": NumberGenerator(_minNumberOfMeals, _maxNumberOfMeals),
    });
    quantityGenerator.seed(_seed);
    final quantities = quantityGenerator.generate();

    final generator = BatchGenerator(
      _getBatch(quantities["drinks"], quantities["meals"]),
    );
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final results = generator.generate();

    return [
      ...results["drinks"],
      ...results["meals"],
    ];
  }

  Map<String, IGenerator> _getBatch(int drinks, int meals) => {
        "drinks": UniqueGenerator(
          MultipleGenerator([
            WineGenerator(),
            BeerGenerator(),
          ]),
          drinks,
        ),
        "meals": UniqueGenerator(
          MealGenerator(),
          meals,
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
