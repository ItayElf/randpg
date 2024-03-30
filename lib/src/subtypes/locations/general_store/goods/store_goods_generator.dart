import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import '../../../../generators/settlements/locations/goods/base_goods_generator.dart';
import 'store_goods_data.dart';

class StoreGoodsGenerator implements Generator<List<Goods>> {
  late int _seed;

  static const _minGoods = 3;
  static const _maxGoods = 7;

  @override
  List<Goods> generate() {
    final quantityGenerator = NumberGenerator(_minGoods, _maxGoods + 1);
    quantityGenerator.seed(_seed);
    final quantity = quantityGenerator.generate();

    final generatedGoodsEntriesGenerator = UniqueGenerator(
      BaseGoodsGenerator(storeGoods),
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
