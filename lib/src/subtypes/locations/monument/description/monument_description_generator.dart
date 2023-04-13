import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../strings_manipulations.dart';
import 'monument_description_data.dart';

/// A class that generates monuments descriptions
class MonumentDescriptionGenerator implements IGenerator<String> {
  late int _seed;
  final String _ownerName;

  MonumentDescriptionGenerator(this._ownerName) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final typeGenerator = ListItemGenerator(monumentType);
    typeGenerator.seed(_seed);
    final type = typeGenerator.generate();

    final generator = BatchGenerator(_getBatch());
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final results = generator.generate();

    final purpose =
        "Created ${results["time"]} ago, this $type stands tribute to ${results["purpose"]}. "
        "It symbolizes the ${results["representing"]}";

    final design =
        "This monument was designed by ${results["creator"]} named ${titledEach(_ownerName)} "
        "who ${results["adjective"]} captured the ${results["captured"]} and employed ${results["style"]} "
        "style to bring their vision to life in this remarkable piece of art";

    final materials =
        "Each element of the $type was meticulously crafted using ${results["materials"]} materials, "
        "As a result, this monument will ${results["present"]}.";

    return [purpose, design, materials].join("\n");
  }

  Map<String, IGenerator> _getBatch() => {
        "time": ListItemGenerator(monumentBuildTime),
        "purpose": ListItemGenerator(monumentPurpose),
        "representing": ListItemGenerator(monumentRepresenting),
        "creator": ListItemGenerator(monumentCreator),
        "adjective": ListItemGenerator(monumentAdjective),
        "captured": ListItemGenerator(monumentCaptured),
        "style": ListItemGenerator(monumentStyle),
        "materials": ListItemGenerator(monumentMaterials),
        "present": ListItemGenerator(monumentPresent),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
