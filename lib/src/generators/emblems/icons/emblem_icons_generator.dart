import '../../../entities/emblems/emblem_icon.dart';
import '../../../subtypes/emblems/emblem_type.dart';
import '../../base/generator.dart';
import '../../base/repeated_generator.dart';
import '../../base/seed_generator.dart';

/// A class that generates emblem icons
class EmblemIconsGenerator implements Generator<List<EmblemIcon>> {
  late int _seed;
  final EmblemType _emblemType;
  final int _iconsCount;

  EmblemIconsGenerator(this._emblemType, this._iconsCount) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<EmblemIcon> generate() {
    final layoutGenerator = _emblemType.getLayoutGenerator(_iconsCount);
    layoutGenerator.seed(_seed);
    final layout = layoutGenerator.generate();

    final svgGenerator =
        RepeatedGenerator(_emblemType.getIconGenerator(), _iconsCount);
    svgGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final svgs = svgGenerator.generate();

    final List<EmblemIcon> list = [];
    for (int i = 0; i < svgs.length; i++) {
      list.add(EmblemIcon(svgWrapper: svgs[i], position: layout[i]));
    }

    return list;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
