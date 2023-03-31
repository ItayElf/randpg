import '../../../base/list_item_generator.dart';

/// Generates a generic description of the street outside the location
class BaseOutsideDescriptionGenerator extends ListItemGenerator<String> {
  static const _streetOutside = [
    'is crowded with shoppers',
    'is adjacent to a small office',
    'is watched by a squad of the town guard',
    'has a pickpocket looking for marks',
    'is empty',
    'has a crowd watching performers',
    'is unusually full of carriages',
    'is shaded by large trees',
    'is shaded by colorful trees',
    'has a beggar harassing passers-by',
    'is full of market stalls',
    'is next to a large public square',
    'is adjacent to a small store',
    'is covered in fallen leaves',
    'contains a heroic monument',
    'has a fortune teller',
    'is ominously quiet',
    'is recently paved with worn brick',
    'has drunken revelers',
    'is lined with a low stone wall',
    'has a town crier with the latest news',
    'is a covered walkway with many twinkling lights',
    'has a weird smell',
    'is next to a grand hall',
    'is adjacent to a large house',
    'is filled with the smell of damp earth'
  ];

  BaseOutsideDescriptionGenerator() : super(_streetOutside);
}
