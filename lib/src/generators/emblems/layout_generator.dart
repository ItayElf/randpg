import 'package:randpg/src/generators/base/list_item_generator.dart';
import 'package:randpg/src/generators/emblems/layout_data.dart';

import '../../entities/emblems/icon_position.dart';
import '../../exceptions/base_exceptions.dart';

class LayoutGenerator extends ListItemGenerator<List<IconPosition>> {
  LayoutGenerator(int iconsCount) : super(_getLayout(iconsCount));

  static List<List<IconPosition>> _getLayout(int iconsCount) {
    switch (iconsCount) {
      case 0:
        return [];
      case 1:
        return oneIconLayouts;
      case 2:
        return twoIconsLayouts;
      case 3:
        return threeIconsLayouts;
      case 4:
        return fourIconsLayout;
    }
    throw GeneratorException("$iconsCount icons are not supported");
  }
}
