import '../../../../entities/npcs/hair.dart';
import '../../../../enums/gender.dart';
import '../../../base/batch_generator.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'beard_data.dart';

/// A class that generates long beards
class LongBeardGenerator implements IGenerator<Hair?> {
  late int _seed;
  final Gender _gender;

  LongBeardGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generate a beard
  @override
  Hair? generate() {
    if (_gender == Gender.female) {
      return null;
    }

    final generator = BatchGenerator({
      "length": ListItemGenerator(longBeard),
      "type": ListItemGenerator(beardShape),
      "color": ListItemGenerator([""]),
    });

    generator.seed(_seed);
    final generatedBeard = generator.generate();
    return Hair.fromMap(generatedBeard);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
