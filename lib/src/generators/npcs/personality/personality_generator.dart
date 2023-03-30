import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/personality.dart';
import '../../../enums/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import 'alignment/alignment_generator.dart';
import 'quirks/personality_quirks_generator.dart';
import 'traits/personality_traits_generator.dart';

/// A class that generates personalities
class PersonalityGenerator implements IGenerator<Personality> {
  late int _seed;
  final Race _race;

  PersonalityGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality based on [_race]
  @override
  Personality generate() {
    final generator = BatchGenerator({
      "alignment": AlignmentGenerator(_race),
      "traits": BasePersonalityTraitsGenerator(_race),
      "quirks": PersonalityQuirksGenerator(_race),
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
