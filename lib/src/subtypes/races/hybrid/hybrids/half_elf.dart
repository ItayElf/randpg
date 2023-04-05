import '../../elf/elf.dart';
import '../../human/human.dart';
import '../hybrid.dart';

/// A class that represents the hybrid between humans and elves
class HalfElf extends Hybrid {
  const HalfElf()
      : super(
          firstRace: const Human(),
          secondRace: const Elf(),
          raceName: "Half-elf",
          pluralRaceName: "Half-elves",
        );
}
