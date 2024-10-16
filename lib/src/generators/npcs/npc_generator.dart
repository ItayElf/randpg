import '../../entities/companions/companion.dart';
import '../../entities/npcs/npc.dart';
import '../../enums/gender.dart';
import '../../subtypes/companions/companion_manager.dart';
import '../../subtypes/races/race.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart ';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/list_batch_generator.dart';
import '../base/list_item_generator.dart';
import '../base/multiple_generator.dart';
import '../base/repeated_generator.dart';
import '../base/seed_generator.dart';
import '../base/weighted_generator.dart';
import '../companions/companion_generator.dart';
import 'goal/goal_generator.dart';
import 'occupation/adventurer_occupation_generator.dart';
import 'occupation/simple_occupation_generator.dart';
import 'personality/personality_generator.dart';
import 'physical/physical_description_generator.dart';

/// A class that represents npcs based on [_race]
class NpcGenerator implements Generator<Npc> {
  late int _seed;
  final Race _race;

  NpcGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  @override
  Npc generate() {
    final genderGenerator = ListItemGenerator(Gender.values);
    genderGenerator.seed(_seed);
    final gender = genderGenerator.generate();

    final companionsNumberGenerator = WeightedGenerator({0: 15, 1: 5, 2: 1});
    companionsNumberGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final companionsNumber = companionsNumberGenerator.generate();

    final companionArgsGenerator = RepeatedGenerator(
      BatchGenerator({
        "type": ListItemGenerator(CompanionManager().activeTypes),
        "gender": ListItemGenerator(Gender.values),
      }),
      companionsNumber,
    );
    companionArgsGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    final companionArgs = companionArgsGenerator.generate();

    final companionsGenerator = ListBatchGenerator(
      companionArgs
          .map((e) => CompanionGenerator(e["type"], e["gender"]))
          .toList(),
    );
    companionsGenerator.seed((_seed + 3) % SeedGenerator.maxSeed);
    final companions = companionsGenerator.generate();

    final generator = BatchGenerator(_getBatch(_race, gender, companions));
    generator.seed((_seed + 4) % SeedGenerator.maxSeed);
    final result = generator.generate();
    return Npc.fromMap(result);
  }

  Map<String, Generator> _getBatch(
    Race race,
    Gender gender,
    List<Companion> companions,
  ) =>
      {
        "name": race.getNameGenerator(gender),
        "age": race.getAgeGenerator(gender),
        "gender": ConstantGenerator(gender.name),
        "race": ConstantGenerator(race.getName()),
        "occupation": MultipleGenerator([
          SimpleOccupationGenerator(),
          AdventurerOccupationGenerator(),
        ]),
        "physicalDescription": FutureGenerator(
          PhysicalDescriptionGenerator(gender, race),
          (physicalDescription) => physicalDescription.toMap(),
        ),
        "personality": FutureGenerator(
          PersonalityGenerator(race),
          (personality) => personality.toMap(),
        ),
        "goal": GoalGenerator(),
        "companions": FutureGenerator(
          ConstantGenerator(companions),
          (companions) => companions.map((e) => e.toMap()).toList(),
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
