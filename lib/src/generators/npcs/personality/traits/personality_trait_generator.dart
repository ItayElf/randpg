import '../../../base/list_item_generator.dart';
import 'personality_traits_data.dart';

/// A class that generates a personality trait
class BasePersonalityTraitGenerator extends ListItemGenerator<String> {
  BasePersonalityTraitGenerator() : super(genericPersonalityTraits);
}
