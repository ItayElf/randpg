import '../../../../generators/base/weighted_generator.dart';

/// A class that generates fur color of monkeys
class MonkeyFurColorGenerator extends WeightedGenerator<String> {
  static const Map<String, int> _furColors = {
    'brown': 5,
    'black': 4,
    'golden': 3,
    'gray': 3,
    'white': 2,
    'red': 2,
    'tan': 2,
    'spotted': 1,
    'striped': 1,
  };

  MonkeyFurColorGenerator() : super(_furColors);
}
