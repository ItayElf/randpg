import '../../entities/npcs/npc.dart';
import '../../entities/npcs/personality.dart';
import '../../entities/npcs/physical_description.dart';
import '../../enums/gender.dart';
import '../../subtypes/races/race.dart';
import '../base/batch_generator.dart';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/multiple_generator.dart';
import '../base/seed_generator.dart';
import 'goal/goal_generator.dart';
import 'occupation/adventurer_occupation_generator.dart';
import 'occupation/simple_occupation_generator.dart';
import 'personality/personality_generator.dart';
import 'physical/physical_description_generator.dart';

class NpcGenerator implements IGenerator<Npc> {
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

    final generator = BatchGenerator(_getBatch(_race, gender));
    generator.seed(_seed);
    final result = generator.generate();
    return Npc.fromMap(result);
  }

  Map<String, IGenerator> _getBatch(Race race, Gender gender) => {
        "name": race.getNameGenerator(gender),
        "age": race.getAgeGenerator(gender),
        "gender": ListItemGenerator([gender.name]),
        "race": ListItemGenerator([race.getName()]),
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
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
