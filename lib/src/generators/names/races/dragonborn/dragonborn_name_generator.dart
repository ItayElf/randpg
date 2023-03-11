import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_dragonborn_name_generator.dart';
import 'male_dragonborn_name_generator.dart';

class DragonbornNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  DragonbornNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    var generator = _isMale
        ? MaleDragonbornNameGenerator()
        : FemaleDragonbornNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
