import '../../../../enums/gender.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../strings_manipulations.dart';
import '../../dogs/appearance/dog_appearance_adjectives_generator.dart';
import '../../dogs/appearance/dog_eye_color_generator.dart';
import '../../dogs/appearance/dog_physique_generator.dart';
import 'cat_breed_generator.dart';
import 'cat_fur_color_generator.dart';

/// A class that generates descriptions of cat appearances
class CatAppearanceGenerator implements Generator<String> {
  late int _seed;
  final String _name;
  final Gender _gender;

  CatAppearanceGenerator(this._name, this._gender) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final batchGenerator = BatchGenerator(_getBatch());
    batchGenerator.seed(_seed);
    final map = batchGenerator.generate();

    final generator = ListItemGenerator([
      _getFirstSyntax(map),
      _getSecondSyntax(map),
    ]);
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  String _getFirstSyntax(Map<String, dynamic> map) =>
      "${titled(_name)} is ${article(map["adjective"])} ${_gender.name} ${titledEach(map["breed"])} with ${map["fur"]} fur. "
      "${titled(_name)} has ${article(map["physique"])} build and ${map["eyes"]} eyes.";

  String _getSecondSyntax(Map<String, dynamic> map) =>
      "${titled(_name)}, ${article(map["adjective"])} ${_gender.name} ${titledEach(map["breed"])}, has ${article(map["fur"])} "
      "colored fur. ${titled(_name)}'s body is ${map["physique"]} and its eyes are ${map["eyes"]}.";

  Map<String, Generator> _getBatch() => {
        "breed": CatBreedGenerator(),
        "adjective": DogAppearanceAdjectiveGenerator(),
        "fur": CatFurColorGenerator(),
        "physique": DogPhysiqueGenerator(),
        "eyes": DogEyeColorGenerator(),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
