import '../../../entities/emblems/hsl_color.dart';
import '../../base/batch_generator.dart';
import '../../base/future_generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/number_generator.dart';

class SecondaryColorGenerator
    extends FutureGenerator<HslColor, Map<String, dynamic>> {
  static const minSaturation = 0;
  static const maxSaturation = 50;

  static const minLightness = 30;
  static const maxLightness = 70;

  SecondaryColorGenerator(HslColor primaryColor)
      : super(
          BatchGenerator({
            "h": ListItemGenerator([(primaryColor.h + 120) % 360]),
            "s": NumberGenerator(minSaturation, maxSaturation + 1),
            "l": NumberGenerator(minLightness, maxLightness + 1),
          }),
          (map) => HslColor.fromMap(map),
        );
}
