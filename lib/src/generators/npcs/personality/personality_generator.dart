import '../../../entities/npcs/personality.dart';
import '../../../subtypes/races/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import 'descriptors/descriptor_generator.dart';

/// A class that generates personalities
class PersonalityGenerator implements Generator<Personality> {
  late int _seed;
  final Race _race;

  static const _numberOfTraits = 2;
  static const _numberOfQuirks = 2;
  static const _numberOfDescriptors = 2;

  PersonalityGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality based on [_race]
  @override
  Personality generate() {
    final alignmentGenerator = _race.getAlignmentGenerator();
    alignmentGenerator.seed(_seed);
    final alignment = alignmentGenerator.generate();

    final generator = BatchGenerator({
      "alignment": ListItemGenerator([alignment.toMap()]),
      "traits": UniqueGenerator(
        _race.getPersonalityTraitGenerator(),
        _numberOfTraits,
      ),
      "quirks": UniqueGenerator(
        _race.getPersonalityQuirkGenerator(),
        _numberOfQuirks,
      ),
      "descriptors": UniqueGenerator(
        DescriptorGenerator(alignment),
        _numberOfDescriptors,
      )
    });
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final result = generator.generate();
    return Personality.fromMap(result);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
