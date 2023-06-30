import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about goblins
class GoblinOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'invading monsters',
    'thugs and brigands',
    "part of the society",
    "not as evil as they used to be",
    "greedy and gold lovers",
    "skillful merchants",
    "bloodthirsty",
    "cannot be part of society",
    "secretly evil",
  ];

  GoblinOpinionGenerator() : super(_opinions);
}
