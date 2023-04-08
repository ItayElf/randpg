import '../../base/list_item_generator.dart';
import 'deity_attributes_data.dart';

/// A class that generates negative attributes for deities
class DeityNegativeAttributeGenerator extends ListItemGenerator<String> {
  DeityNegativeAttributeGenerator() : super(deityNegativeAttributes);
}
