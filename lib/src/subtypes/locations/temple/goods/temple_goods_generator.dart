import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import '../../../../generators/settlements/locations/goods/base_goods_generator.dart';
import 'temple_goods_data.dart';

/// A class that generates temple services
class TempleServicesGenerator implements Generator<List<Goods>> {
  late int _seed;

  static const _minServices = 1;
  static const _maxServices = 4;

  @override
  List<Goods> generate() {
    final quantityGenerator = NumberGenerator(_minServices, _maxServices + 1);
    quantityGenerator.seed(_seed);
    final quantity = quantityGenerator.generate();

    final generatedGoodsEntriesGenerator = UniqueGenerator(
      BaseGoodsGenerator(templeServices),
      quantity,
    );
    generatedGoodsEntriesGenerator.seed(_seed);
    return generatedGoodsEntriesGenerator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
