import 'package:randpg/entities/guilds.dart';

void main() {
  // Generating each of the active guild types
  for (GuildType guildType in GuildManager().activeTypes) {
    // generates a random guild with the given type
    Guild guild = GuildGenerator(guildType).generate();

    print(guild.toJson());
  }
}
