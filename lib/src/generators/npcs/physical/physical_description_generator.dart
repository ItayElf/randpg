import '../../../entities/npcs/hair.dart';
import '../../../entities/npcs/physical_description.dart';
import '../../../enums/gender.dart';
import '../../../enums/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import 'beard/beard_generator.dart';
import 'build/build_generator.dart';
import 'eyes/base_eyes_generator.dart';
import 'face/face_generator.dart';
import 'hair/hair_generator.dart';
import 'height/height_generator.dart';
import 'skin/skin_generator.dart';
import 'special_features/special_feature_generator.dart';

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
        "hairStyle": HairGenerator(gender, race),
        "eyes": BaseEyesGenerator(),
        "skin": SkinGenerator(race),
        "height": HeightGenerator(race),
        "build": BuildGenerator(race),
        "face": BaseFaceGenerator(race),
        "beard": BeardGenerator(gender, race),
        "specialFeatures": BaseSpecialFeaturesGenerator(race),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
