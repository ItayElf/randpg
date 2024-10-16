import '../../../../generators/base/list_item_generator.dart';

class MonkeyPhysiqueGenerator extends ListItemGenerator<String> {
  static const _physique = [
    'slender',
    'muscular',
    'lean',
    'stocky',
    'graceful',
    'compact',
    'agile',
    'nimble',
  ];

  MonkeyPhysiqueGenerator() : super(_physique);
}
