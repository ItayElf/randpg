import '../../../generators/base/list_item_generator.dart';

/// A class that generates orcish skin tones
class OrcSkinGenerator extends ListItemGenerator<String> {
  static const _skinTones = ["green", "gray"];

  OrcSkinGenerator() : super(_skinTones);
}
