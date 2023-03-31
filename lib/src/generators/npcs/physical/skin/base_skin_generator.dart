import '../../../base/list_item_generator.dart';

/// A class that generates generic skin tones
class BaseSkinGenerator extends ListItemGenerator<String> {
  static const _skinTones = ['white', 'pale', 'brown', 'dark'];

  BaseSkinGenerator() : super(_skinTones);
}
