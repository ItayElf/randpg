import '../../base/list_item_generator.dart';
import 'deity_attributes_data.dart';

/// A class that generates positive attributes for deities
class DeityPositiveAttributeGenerator extends ListItemGenerator<String> {
  DeityPositiveAttributeGenerator() : super(deityPositiveAttributes);
}
