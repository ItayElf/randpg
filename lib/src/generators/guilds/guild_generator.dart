import '../../entities/guilds/guilds.dart';
import '../../subtypes/guilds/guild_type.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart ';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/repeated_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../emblems/emblem_generator.dart';
import '../fixable.dart';
import '../settlements/important_characters/important_character_generator.dart';

/// A class that generates guilds
class GuildGenerator implements Generator<Guild> {
  late int _seed;
  final GuildType _guildType;

  static const _numberOfSpecialties = 2;
  static const _numberOfQuests = 2;
  static const _numberOfNotables = 3;

  GuildGenerator(this._guildType) {
    _seed = SeedGenerator.generate();
  }

  @override
  Guild generate() {
    final nameGenerator = _guildType.getNameGenerator();
    nameGenerator.seed(_seed);
    final name = nameGenerator.generate();

    final generator = BatchGenerator(_getBatch(name));
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    Guild guild = Guild.fromMap(generator.generate());

    if (_guildType is Fixable<Guild>) {
      guild = (_guildType as Fixable).getFixed(guild);
    }

    return guild;
  }

  Map<String, Generator> _getBatch(String guildName) => {
        "name": ConstantGenerator(guildName),
        "leader": FutureGenerator(
          ImportantCharacterGenerator(
              ConstantGenerator(_guildType.getLeaderOccupation()), null),
          (leader) => leader.toMap(),
        ),
        "guildType": ConstantGenerator(_guildType.getGuildType()),
        "reputation": _guildType.getReputationGenerator(),
        "history": _guildType.getHistoryGenerator(guildName),
        "emblem": FutureGenerator(
          EmblemGenerator(_guildType.getEmblemType()),
          (emblem) => emblem.toMap(),
        ),
        "motto": _guildType.getMottoGenerator(),
        "specialties": UniqueGenerator(
          _guildType.getSpecialtyGenerator(),
          _numberOfSpecialties,
        ),
        "quests": UniqueGenerator(
          _guildType.getQuestGenerator(),
          _numberOfQuests,
        ),
        "notableMembers": FutureGenerator(
          RepeatedGenerator(
            ImportantCharacterGenerator(
                _guildType.getMemberOccupationGenerator(), null),
            _numberOfNotables,
          ),
          (notables) => notables.map((e) => e.toMap()).toList(),
        )
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
