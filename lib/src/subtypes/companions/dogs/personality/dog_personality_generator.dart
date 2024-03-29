import 'package:randpg/src/generators/base/unique_generator.dart';
import 'package:randpg/src/strings_manipulations.dart';
import 'package:randpg/src/subtypes/companions/dogs/personality/dog_activity_generator.dart';
import 'package:randpg/src/subtypes/companions/dogs/personality/dog_personality_adjective_generator.dart';

import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';

/// A class that generates descriptions of dog personalities
class DogPersonalityGenerator implements Generator<String> {
  late int _seed;
  final String _name;

  DogPersonalityGenerator(this._name) {
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
      "${titled(_name)} is ${titled(map["adjectives"].first)} and ${map["adjectives"].last} dog. ${titled(_name)} "
      "likes to ${map["activities"].first} and to ${map["activities"].last}.";

  String _getSecondSyntax(Map<String, dynamic> map) =>
      "${titled(_name)}'s most prominent trait is being ${map["adjectives"].first}. They are also ${map["adjectives"].last} "
      "when they are around people they know. ${toGerund(map["activities"].first.split(" ").first)} "
      "${map["activities"].first.split(" ").sublist(1).join(" ")} is ${titled(_name)}'s "
      "favorite activity. They also like to ${map["activities"].last}.";

  Map<String, Generator> _getBatch() => {
        "adjectives": UniqueGenerator(DogPersonalityAdjectiveGenerator(), 2),
        "activities": UniqueGenerator(DogActivityGenerator(), 2),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
