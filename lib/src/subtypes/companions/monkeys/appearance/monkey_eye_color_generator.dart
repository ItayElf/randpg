import '../../../../generators/base/weighted_generator.dart';

/// A class that generates eye color of monkeys
class MonkeyEyeColorGenerator extends WeightedGenerator<String> {
  static const Map<String, int> _eyeColors = {
    'brown': 5,
    'green': 3,
    'blue': 3,
    'amber': 2,
    'hazel': 2,
    'yellow': 1,
    'gray': 1,
  };

  MonkeyEyeColorGenerator() : super(_eyeColors);
}
