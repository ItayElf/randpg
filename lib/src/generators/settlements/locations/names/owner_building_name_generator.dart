import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';

class OwnerBuildingNameGenerator implements IGenerator<String> {
  late int _seed;
  final String _ownerName;
  final String _locationType;

  OwnerBuildingNameGenerator(this._ownerName, this._locationType) {
    _seed = SeedGenerator.generate();
  }

  List<IGenerator<String>> get _generatorsTemplate => [
        ListItemGenerator(["$_ownerName's"]),
        ListItemGenerator([_locationType]),
      ];

  @override
  String generate() {
    List<IGenerator<String>> generators = List.from(_generatorsTemplate);

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }

    return generators
        .map((generator) => generator.generate())
        .toList()
        .join(" ");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
