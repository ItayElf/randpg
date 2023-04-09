import '../../entities/deities/deity.dart';
import '../../entities/npcs/alignment.dart';
import '../../enums/gender.dart';
import '../../subtypes/deities/deity_type.dart';
import '../../subtypes/races/race.dart';
import '../base/batch_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/number_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../fixable.dart';

/// A class that generates deities
class DeityGenerator implements IGenerator<Deity> {
  late int _seed;
  final DeityType _deityType;
  final Alignment _alignment;

  static const _minDomains = 1;
  static const _maxDomains = 2;

  DeityGenerator(this._deityType, this._alignment) {
    _seed = SeedGenerator.generate();
  }

  @override
  Deity generate() {
    final genderGenerator = _deityType.getGenderGenerator();
    genderGenerator.seed(_seed);
    final gender = genderGenerator.generate();

    final raceGenerator = _deityType.getWorshipedByGenerator();
    raceGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final worshipedBy = raceGenerator.generate();

    final domainCountGenerator = NumberGenerator(_minDomains, _maxDomains);
    domainCountGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    final domainCount = domainCountGenerator.generate();

    final generator = BatchGenerator(_getBatch(
      gender,
      worshipedBy,
      _alignment,
      domainCount,
    ));
    generator.seed((_seed + 3) % SeedGenerator.maxSeed);
    Deity deity = Deity.fromMap(generator.generate());

    if (_deityType is Fixable<Deity>) {
      deity = (_deityType as Fixable).getFixed(deity);
    }
    return deity;
  }

  Map<String, IGenerator> _getBatch(
    Gender gender,
    Race? worshipedBy,
    Alignment alignment,
    int domainCount,
  ) =>
      {
        "name": _deityType.getNameGenerator(gender, worshipedBy),
        "gender": ListItemGenerator([gender.name]),
        "deityType": ListItemGenerator([_deityType.getDeityType()]),
        "domains": UniqueGenerator(
          _deityType.getDomainGenerator(alignment),
          domainCount,
        ),
        "alignment": ListItemGenerator([alignment.toMap()]),
        "depiction": _deityType.getDepictionGenerator(worshipedBy),
        "worshipedBy": ListItemGenerator([worshipedBy?.getName()]),
        "worshipers": _deityType.getWorshipersGenerator(),
        "shrinesRarity": _deityType.getShrinesRarityGenerator(),
        "positiveAttribute": _deityType.getPositiveAttributeGenerator(),
        "negativeAttribute": _deityType.getNegativeAttributeGenerator(),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
