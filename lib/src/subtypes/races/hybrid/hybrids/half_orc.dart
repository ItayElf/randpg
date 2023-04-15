import '../../orc/orc.dart';
import '../../human/human.dart';
import '../hybrid.dart';

/// A class that represents the hybrid between humans and orcs
class HalfOrc extends Hybrid {
  const HalfOrc()
      : super(
          firstRace: const Human(),
          secondRace: const Orc(),
          raceName: "half-orc",
          pluralRaceName: "half-orcs",
        );
}
