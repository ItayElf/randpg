import '../../../../generators/base/list_item_generator.dart';

/// A class that generates river sizes
class RiverSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    "is one of the longest rivers on the continent",
    "is one of the shortest rivers on the continent",
    "is one of the widest rivers on the continent",
    "is one of the narrowest rivers on the continent",
    "flows through multiple countries",
    "is entirely contained within one country",
    "is so wide that it has formed multiple channels",
    "is so narrow that it is easily crossed on foot in some places",
    "is a short river",
    "is a long river",
    "is a medium sized river",
    "is a wide river",
    "is a narrow river",
  ];

  RiverSizeGenerator() : super(_sizes);
}
