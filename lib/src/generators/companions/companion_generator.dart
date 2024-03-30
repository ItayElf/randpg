import '../../entities/companions/companion.dart';
import '../../enums/gender.dart';
import '../../subtypes/companions/companion_type.dart';
import '../base/batch_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/seed_generator.dart';
import '../fixable.dart';

/// A class that generates companions
class CompanionGenerator implements Generator<Companion> {
  late int _seed;
  final CompanionType _companionType;
  final Gender _gender;

  CompanionGenerator(this._companionType, this._gender) {
    _seed = SeedGenerator.generate();
  }

  @override
  Companion generate() {
    final nameGenerator = _companionType.getNameGenerator(_gender);
    nameGenerator.seed(_seed);
    final name = nameGenerator.generate();

    final generator = BatchGenerator(_getBatch(name));
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    Companion companion = Companion.fromMap(generator.generate());

    if (_companionType is Fixable<Companion>) {
      companion = (_companionType as Fixable).getFixed(companion);
    }

    return companion;
  }

  Map<String, Generator> _getBatch(String name) => {
        "name": ListItemGenerator([name]),
        "gender": ListItemGenerator([_gender.name]),
        "companionType": ListItemGenerator([_companionType.getCompanionType()]),
        "appearance": _companionType.getAppearanceGenerator(name, _gender),
        "personality": _companionType.getPersonalityGenerator(name, _gender),
        "skills": _companionType.getSkillsGenerator(),
        "quirks": _companionType.getQuirksGenerator(),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
