/// An enum representing the available races
enum Race {
  dragonborn("dragonborn", "dragonborns"),
  dwarf("dwarf", "dwarfs"),
  elf("elf", "elves"),
  gnome("gnome", "gnomes"),
  halfElf("half-elf", "half-elves"),
  halfling("halfling", "halflings"),
  human("human", "humans"),
  orc("orc", "orcs"),
  tiefling("tiefling", "tieflings");

  const Race(this.name, this.pluralName);

  /// The singular name of the race, like "human" or "elf"
  final String name;

  /// The plural name of the race, like "humans" or "elves"
  final String pluralName;
}
