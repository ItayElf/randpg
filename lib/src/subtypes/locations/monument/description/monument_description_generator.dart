import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
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
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    final results = generator.generate();

    final purpose =
        "built ${results["time"]} ago, this monument was built to ${results["purpose"]}. "
        "It represents the ${results["representing"]}";

    final design =
        "This monument was designed by ${results["creator"]} named ${titled(_ownerName)} "
        "who ${results["adjective"]} captured the ${results["captured"]} of the region and used ${results["style"]} "
        "style to convey their vision in this piece of art";

    final materials =
        "every element was crafted and created with ${results["materials"]} materials from local suppliers, "
        "ensuring this monument will ${results["present"]}";

    return [purpose, design, materials].join("\n");
  }

  static String titled(String string) => string
      .split(" ")
      .map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
      .join(" ");

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
