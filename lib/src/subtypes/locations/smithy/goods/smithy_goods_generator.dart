import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import '../../../../generators/settlements/locations/goods/base_goods_generator.dart';
import 'smithy_goods_data.dart';

/// A class that generates smithy goods
class SmithyGoodsGenerator implements Generator<List<Goods>> {
  late int _seed;

  static const _minGoods = 2;
  static const _maxGoods = 5;

  @override
  List<Goods> generate() {
    final quantityGenerator = NumberGenerator(_minGoods, _maxGoods + 1);
    quantityGenerator.seed(_seed);
    final quantity = quantityGenerator.generate();

    final generatedGoodsEntriesGenerator = UniqueGenerator(
      BaseGoodsGenerator(smithyGoods),
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
