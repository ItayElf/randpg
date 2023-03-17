import '../../../../entities/npcs/hair.dart';
import '../../../../enums/gender.dart';
import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'beard_data.dart';

/// A class that generates beards
class BeardGenerator implements IGenerator<Hair?> {
  late int _seed;
  final Gender _gender;
  final Race _race;

  BeardGenerator(this._gender, this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generate a beard
  @override
  Hair? generate() {
    if (_gender == Gender.female) {
      return null;
    }

    List<String> pool = beardLength;
    for (var entry in beardMap.entries) {
      if (entry.key.contains(_race)) {
        pool = List.from(entry.value);
      }
    }

    final generators = [
      ListItemGenerator(pool),
      ListItemGenerator(beardShape),
    ];

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    final generatedBeard =
        generators.map((generator) => generator.generate()).toList();

    if (generatedBeard.first.isEmpty) {
      return null;
    }

    return Hair(
      length: generatedBeard[0],
      type: generatedBeard[1],
      color: "",
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
