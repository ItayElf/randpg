import '../../../entities/npcs/physical_description.dart';
import '../../../enums/gender.dart';
import '../../../subtypes/races/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/number_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';

/// A class that generates physical descriptions for npcs
class PhysicalDescriptionGenerator implements IGenerator<PhysicalDescription> {
  late int _seed;
  final Gender _gender;
  final Race _race;

  static const _minSpecialFeatures = 1;
  static const _maxSpecialFeatures = 3;

  PhysicalDescriptionGenerator(this._gender, this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates physical description for npcs
  @override
  PhysicalDescription generate() {
    final generator = BatchGenerator(_makeBatch(_gender, _race));
    generator.seed(_seed);
    final result = generator.generate();

    result["hairStyle"] = (result["hairStyle"]).toMap();
    result["beard"] = (result["beard"])?.toMap();

    return PhysicalDescription.fromMap(result);
  }

  Map<String, IGenerator> _makeBatch(Gender gender, Race race) {
    final generator =
        NumberGenerator(_minSpecialFeatures, _maxSpecialFeatures + 1);
    generator.seed(_seed);
    final features = generator.generate();

    return {
      "hairStyle": race.getHairGenerator(gender),
      "eyes": race.getEyesGenerator(gender),
      "skin": race.getSkinGenerator(gender),
      "height": race.getHeightGenerator(gender),
      "build": race.getBuildGenerator(gender),
      "face": race.getFaceGenerator(gender),
      "beard": race.getBeardGenerator(gender),
      "specialFeatures": UniqueGenerator(
        race.getSpecialFeatureGenerator(gender),
        features,
      ),
    };
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
