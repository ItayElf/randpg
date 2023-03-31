import '../../../base/list_item_generator.dart';
import 'personality_quirks_data.dart';

/// A class that generates a personality quirk
class BasePersonalityQuirkGenerator extends ListItemGenerator<String> {
  BasePersonalityQuirkGenerator() : super(genericPersonalityQuirks);
}
