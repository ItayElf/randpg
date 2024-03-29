import '../../../strings_manipulations.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';

/// A class that generates descriptions of companions personalities
class CompanionPersonalityGenerator implements Generator<String> {
  late int _seed;
  final String _name;
  final Generator<String> _adjectiveGenerator;
  final Generator<String> _activityGenerator;

  CompanionPersonalityGenerator(
    this._name,
    this._adjectiveGenerator,
    this._activityGenerator,
  ) {
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
        "adjectives": UniqueGenerator(_adjectiveGenerator, 2),
        "activities": UniqueGenerator(_activityGenerator, 2),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
