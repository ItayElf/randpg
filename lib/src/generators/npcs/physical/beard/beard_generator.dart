import 'package:randpg/generators/generators.dart';

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

    List<String> pool = _getPool(_race);

    final generator = BatchGenerator({
      "length": ListItemGenerator(pool),
      "type": ListItemGenerator(beardShape),
      "color": ListItemGenerator([""]),
    });

    generator.seed(_seed);
    final generatedBeard = generator.generate();

    if (generatedBeard["length"].isEmpty) {
      return null;
    }

    return Hair.fromMap(generatedBeard);
  }

  /// Generates the pool to choose the beard from
  static List<String> _getPool(Race race) {
    List<String> pool = beardLength;
    for (var entry in beardMap.entries) {
      if (entry.key.contains(race)) {
        pool = List.from(entry.value);
      }
    }
    return List.from(pool);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
