import '../../../../entities/settlements/goods.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import 'library_books_data.dart';

/// A class that generates books
class LibraryBooksGenerator implements IGenerator<List<Goods>> {
  late int _seed;

  static const _minBooks = 2;
  static const _maxBooks = 5;

  @override
  List<Goods> generate() {
    final quantityGenerator = NumberGenerator(_minBooks, _maxBooks + 1);
    quantityGenerator.seed(_seed);
    final quantity = quantityGenerator.generate();

    final generatedGoodsEntriesGenerator = UniqueGenerator(
      ListItemGenerator(libraryBooks),
      quantity,
    );
    generatedGoodsEntriesGenerator.seed(_seed);
    return generatedGoodsEntriesGenerator
        .generate()
        .map((bookName) => Goods(name: "book", description: bookName))
        .toList();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
