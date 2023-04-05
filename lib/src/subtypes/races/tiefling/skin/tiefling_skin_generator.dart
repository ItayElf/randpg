import '../../../../generators/base/list_item_generator.dart';

/// A class that generates tiefling skin tones
class TieflingSkinGenerator extends ListItemGenerator<String> {
  static const _skinTones = ["red", "purple"];

  TieflingSkinGenerator() : super(_skinTones);
}
