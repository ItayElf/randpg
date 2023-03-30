import '../../../entities/npcs/hair.dart';
import '../../../entities/npcs/physical_description.dart';
import '../../../enums/gender.dart';
import '../../../races/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';

/// A class that generates physical descriptions for npcs
class PhysicalDescriptionGenerator implements IGenerator<PhysicalDescription> {
  late int _seed;
  final Gender _gender;
  final Race _race;

  PhysicalDescriptionGenerator(this._gender, this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates physical description for npcs
  @override
  PhysicalDescription generate() {
    final generator = BatchGenerator(_getBatch(_gender, _race));
    generator.seed(_seed);
    final result = generator.generate();

    result["hairStyle"] = (result["hairStyle"] as Hair).toMap();
    result["beard"] = (result["beard"] as Hair?)?.toMap();

    return PhysicalDescription.fromMap(result);
  }

  static Map<String, IGenerator> _getBatch(Gender gender, Race race) => {
        "hairStyle": race.getHairGenerator(gender),
        "eyes": race.getEyesGenerator(gender),
        "skin": race.getEyesGenerator(gender),
        "height": race.getHeightGenerator(gender),
        "build": race.getBuildGenerator(gender),
        "face": race.getFaceGenerator(gender),
        "beard": race.getBeardGenerator(gender),
        "specialFeatures": race.getSpecialFeaturesGenerator(gender),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
