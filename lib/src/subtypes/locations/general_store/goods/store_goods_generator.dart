import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import 'store_goods_data.dart';

class StoreGoodsGenerator implements IGenerator<List<Goods>> {
  late int _seed;

  static const _minGoods = 3;
  static const _maxGoods = 7;

  @override
  List<Goods> generate() {
    final quantityGenerator = NumberGenerator(_minGoods, _maxGoods);
    quantityGenerator.seed(_seed);
    final quantity = quantityGenerator.generate();

    final generatedGoodsEntriesGenerator = UniqueGenerator(
      ListItemGenerator(storeGoods.entries.toList()),
      quantity,
    );
    generatedGoodsEntriesGenerator.seed(_seed);
    final generatedGoodsEntries = generatedGoodsEntriesGenerator.generate();

    return generatedGoodsEntries
        .map((entry) => Goods(name: entry.key, price: entry.value))
        .toList();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
