import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/unique_generator.dart';
import '../../../../strings_manipulations.dart';
import 'dog_activity_generator.dart';
import 'dog_personality_adjective_generator.dart';

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
      "${titled(_name)} is ${article(map["adjectives"].first)} and ${map["adjectives"].last} dog. ${titled(_name)} "
      "likes to ${map["activities"].first} and to ${map["activities"].last}.";

  String _getSecondSyntax(Map<String, dynamic> map) =>
      "${titled(_name)}'s most prominent trait is being ${map["adjectives"].first}. It is also ${map["adjectives"].last} "
      "when it is around people it knows. ${titled(toGerund(map["activities"].first.split(" ").first))} "
      "${map["activities"].first.split(" ").sublist(1).join(" ")} is ${titled(_name)}'s "
      "favorite activity. It also likes to ${map["activities"].last}.";

  Map<String, Generator> _getBatch() => {
        "adjectives": UniqueGenerator(DogPersonalityAdjectiveGenerator(), 2),
        "activities": UniqueGenerator(DogActivityGenerator(), 2),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
