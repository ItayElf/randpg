import 'package:randpg/generators/generators.dart';

import '../../base/weighted_generator.dart';

/// A class that generates landscape locations
class LandscapeLocationGenerator extends ListItemGenerator<String> {
  static const _locations = [
    "in the south of the continent",
    "in the north of the continent",
    "in the east of the continent",
    "in the west of the continent",
    "in the middle of the continent",
    "in the southeast of the continent",
    "in the southwest of the continent",
    "in the northeast of the continent",
    "in the northwest of the continent",
  ];

  LandscapeLocationGenerator() : super(_locations);
}
