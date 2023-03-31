import 'package:randpg/src/generators/npcs/personality/descriptors/descriptor_generator.dart';

import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/personality.dart';
import '../../../races/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';

/// A class that generates personalities
class PersonalityGenerator implements IGenerator<Personality> {
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
    final generator = BatchGenerator({
      "alignment": _race.getAlignmentGenerator(),
      "traits": UniqueGenerator(
        _race.getPersonalityTraitGenerator(),
        _numberOfTraits,
      ),
      "quirks": UniqueGenerator(
        _race.getPersonalityQuirkGenerator(),
        _numberOfQuirks,
      ),
      "descriptors": UniqueGenerator(
        DescriptorGenerator(),
        _numberOfDescriptors,
      )
    });
    generator.seed(_seed);

    final result = generator.generate();
    result["alignment"] = (result["alignment"] as Alignment).toMap();

    return Personality.fromMap(result);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
