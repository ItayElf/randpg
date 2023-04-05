import '../../base/weighted_generator.dart';

/// A class that generates landscape locations
class LandscapeLocationGenerator extends WeightedGenerator<String> {
  static const _locations = {
    "in the south of the continent": 2,
    "in the north of the continent": 2,
    "in the east of the continent": 2,
    "in the west of the continent": 2,
    "in the middle of the continent": 2,
    "in the southeast of the continent": 2,
    "in the southwest of the continent": 2,
    "in the northeast of the continent": 2,
    "in the northwest of the continent": 2,
    'on an island': 1,
    'in a volcanic region': 1,
    'in a cave system': 1,
    'underwater': 1,
    'in the sky': 1,
  };

  LandscapeLocationGenerator() : super(_locations);
}
