import '../../entities/emblems/emblem.dart';
import '../../entities/emblems/hsl_color.dart';
import '../../subtypes/emblems/emblem_type.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart ';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/seed_generator.dart';
import 'icons/emblem_icons_generator.dart';

class EmblemGenerator implements Generator<Emblem> {
  late int _seed;
  final EmblemType _emblemType;

  EmblemGenerator(this._emblemType) {
    _seed = SeedGenerator.generate();
  }

  @override
  Emblem generate() {
    final primaryColorGenerator = _emblemType.getPrimaryColorGenerator();
    primaryColorGenerator.seed(_seed);
    final primaryColor = primaryColorGenerator.generate();

    final secondaryColorGenerator =
        _emblemType.getSecondaryColorGenerator(primaryColor);
    secondaryColorGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final secondaryColor = secondaryColorGenerator.generate();

    final iconCountGenerator = _emblemType.getIconsCountGenerator();
    iconCountGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    final iconCount = iconCountGenerator.generate();

    final generator =
        BatchGenerator(_getBatch(primaryColor, secondaryColor, iconCount));
    generator.seed((_seed + 3) % SeedGenerator.maxSeed);

    return Emblem.fromMap(generator.generate());
  }

  Map<String, Generator> _getBatch(
          HslColor primaryColor, HslColor secondaryColor, int iconCount) =>
      {
        "shape": FutureGenerator(
          _emblemType.getShapeGenerator(),
          (svg) => svg.toMap(),
        ),
        "pattern": FutureGenerator(
          _emblemType.getPatternGenerator(),
          (svg) => svg.toMap(),
        ),
        "icons": FutureGenerator(
          EmblemIconsGenerator(_emblemType, iconCount),
          (icons) => icons.map((e) => e.toMap()).toList(),
        ),
        "primaryColor": ConstantGenerator(primaryColor.toMap()),
        "secondaryColor": ConstantGenerator(secondaryColor.toMap()),
        "iconsColor": FutureGenerator(
          _emblemType.getIconsColorGenerator(primaryColor, secondaryColor),
          (color) => color.toMap(),
        ),
        "type": ConstantGenerator(_emblemType.getEmblemType())
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
