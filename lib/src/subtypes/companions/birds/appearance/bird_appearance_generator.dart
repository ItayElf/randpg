import '../../../../enums/gender.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import '../../../../strings_manipulations.dart';
import '../../dogs/appearance/dog_appearance_adjectives_generator.dart';
import 'bird_eye_color_generator.dart';
import 'bird_feathers_color_generator.dart';
import 'bird_physique_generator.dart';
import 'bird_specie_generator.dart';

/// A class that generates descriptions of bird appearances
class BirdAppearanceGenerator implements Generator<String> {
  late int _seed;
  final String _name;
  final Gender _gender;

  BirdAppearanceGenerator(this._name, this._gender) {
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
      "${titled(_name)} is ${article(map["adjective"])} ${_gender.name} ${titledEach(map["specie"])} with ${map["feathers"].first} feathers. "
      "${titled(_name)} has ${article(map["physique"])} build and ${map["eyes"]} eyes.";

  String _getSecondSyntax(Map<String, dynamic> map) =>
      "${titled(_name)}, ${article(map["adjective"])} ${_gender.name} ${titledEach(map["specie"])}, has ${article(map["feathers"].first)} "
      "colored feathers with ${map["feathers"].last} accents. ${titled(_name)}'s body is ${map["physique"]} and its eyes are ${map["eyes"]}.";

  Map<String, Generator> _getBatch() => {
        "specie": BirdSpecieGenerator(),
        "adjective": DogAppearanceAdjectiveGenerator(),
        "feathers": UniqueGenerator(BirdFeathersColorGenerator(), 2),
        "physique": BirdPhysiqueGenerator(),
        "eyes": BirdEyeColorGenerator(),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
