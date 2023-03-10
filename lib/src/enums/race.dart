enum Race {
  human("human", "humans"),
  dragonborn("dragonborn", "dragonborns"),
  dwarf("dwarf", "dwarves"),
  elf("elf", "elves"),
  halfElf("half-elf", "half-elves"),
  gnome("gnome", "gnomes"),
  halfling("halfling", "halflings"),
  orc("orc", "orcs"),
  tiefling("tiefling", "tieflings");

  const Race(this.name, this.pluralName);

  final String name;
  final String pluralName;
}
