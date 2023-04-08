import '../../base/list_item_generator.dart';

/// A class that generates the amount of shrines a deity has
class DeityManyShrinesGenerator extends ListItemGenerator<String> {
  static const _shrines = [
    "spread across the continent",
    "can be found in the big cities",
    "are common",
    'are located in every major settlement',
    'are scattered across the countryside',
    'are built inside caves',
    "are present in every noble's estate",
    'are made of crystal and impossible to miss',
    'are located on every trade route',
    'are built on the ruins of other shrines',
    'are situated in the heart of major cities',
    'are hidden behind waterfalls',
    'are built inside the trunks of ancient trees',
    'are made of stone and blend in with the landscape',
    'are situated on the highest points of every island',
  ];

  DeityManyShrinesGenerator() : super(_shrines);
}
