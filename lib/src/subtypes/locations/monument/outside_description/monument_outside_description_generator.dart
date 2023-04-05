import '../../../../generators/base/list_item_generator.dart';

/// Generates a description of the street outside the monument
class MonumentOutsideDescriptionGenerator extends ListItemGenerator<String> {
  static const _streetOutside = [
    'is watched by a squad of the town guard',
    'is empty',
    'is ominously quiet',
    'is lined with a low stone wall',
    'has a weird smell',
    'is full of people',
    'is clean',
    'was neglected in the past year or so'
  ];

  MonumentOutsideDescriptionGenerator() : super(_streetOutside);
}
