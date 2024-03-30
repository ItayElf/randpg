import '../../../../enums/gender.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import '../../../../strings_manipulations.dart';
import 'imp_appearance_adjective_generator.dart';
import 'imp_eye_color_generator.dart';
import 'imp_feature_generator.dart';
import 'imp_physique_generator.dart';
import 'imp_skin_generator.dart';

/// A class that generates descriptions of imps appearances
class ImpAppearanceGenerator implements Generator<String> {
  late int _seed;
  final String _name;
  final Gender _gender;

  ImpAppearanceGenerator(this._name, this._gender) {
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
      "${titled(_name)} is ${article(map["adjective"])} ${_gender.name} imp with ${article(map["skin"].first)} skin. "
      "${titled(_name)} has ${article(map["physique"])} build and ${map["eyes"]} eyes. ${titled(_name)} has ${map["features"].first} "
      "and ${map["features"].last}.";

  String _getSecondSyntax(Map<String, dynamic> map) =>
      "${titled(_name)}, ${article(map["adjective"])} ${_gender.name} imp, has ${article(map["skin"].first)} "
      "and ${article(map["skin"].last)} skin. ${titled(_name)}'s body is ${map["physique"]} and its eyes are ${map["eyes"]}. "
      "${titled(map["features"].first)} and ${map["features"].last} are the defining features of ${titled(_name)}.";

  Map<String, Generator> _getBatch() => {
        "adjective": ImpAppearanceAdjectiveGenerator(),
        "skin": UniqueGenerator(ImpSkinGenerator(), 2),
        "physique": ImpPhysiqueGenerator(),
        "eyes": ImpEyeColorGenerator(),
        "features": UniqueGenerator(ImpFeatureGenerator(), 2),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
