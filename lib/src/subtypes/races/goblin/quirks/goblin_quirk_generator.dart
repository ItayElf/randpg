import '../../../../generators/base/list_item_generator.dart';

/// A class that generates a gnomish personality quirk
class GoblinPersonalityQuirkGenerator extends ListItemGenerator<String> {
  static const _goblinQuirks = [
    "has an uncanny ability to mimic voices and uses it to confuse and deceive others.",
    "possesses a bizarre fascination with shiny objects and collects them obsessively.",
    "communicates through a complex system of clicks, whistles, and body gestures.",
    "has an insatiable appetite for exotic and bizarre food, often consuming things that would be considered inedible by others.",
    "exhibits a constant need for attention and will go to great lengths to be the center of it.",
    "believes in various superstitions and rituals, following them diligently to avoid bad luck.",
    "has an exceptional talent for creating intricate traps and enjoys setting them up to catch unsuspecting victims.",
    "carries around a pet rodent or insect and treats it like a trusted companion.",
    "possesses an innate ability to sense hidden treasure and becomes ecstatic when in close proximity to it.",
    "displays an intense fear of open water and avoids it at all costs.",
    "finds joy in pulling pranks on other goblins, often resulting in chaotic situations.",
    "possesses an unusually acute sense of smell, which allows them to detect even the faintest odors.",
    "practices an ancient form of goblin martial arts and is always eager to demonstrate their skills.",
    "holds a deep-seated grudge against elves and will actively seek opportunities to cause them trouble.",
    "takes pleasure in inventing and constructing elaborate contraptions, which are often more dangerous than helpful.",
    "has a peculiar fascination with riddles and puzzles, frequently challenging others to solve them.",
    "exhibits an unusual talent for mimicry, being able to imitate the sounds and voices of various creatures.",
    "displays an extraordinary agility and dexterity, often performing acrobatic feats just for the thrill of it.",
    "carries a collection of bizarre and seemingly useless trinkets, claiming they possess hidden magical properties.",
    "possesses a natural affinity for wild animals and can communicate with them on a basic level."
  ];

  GoblinPersonalityQuirkGenerator() : super(_goblinQuirks);
}
