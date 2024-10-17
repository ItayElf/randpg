import '../../../entities/emblems/hsl_color.dart';
import '../../base/batch_generator.dart';
import '../../base/constant_generator.dart';
import '../../base/future_generator.dart';
import '../../base/number_generator.dart';

/// A class that generates secondary colors
class SecondaryColorGenerator
    extends FutureGenerator<HslColor, Map<String, dynamic>> {
  static const minSaturation = 0;
  static const maxSaturation = 50;

  static const minLightness = 10;
  static const maxLightness = 50;

  SecondaryColorGenerator(HslColor primaryColor)
      : super(
          BatchGenerator({
            "h": ConstantGenerator((primaryColor.h + 120) % 360),
            "s": NumberGenerator(minSaturation, maxSaturation + 1),
            "l": NumberGenerator(minLightness, maxLightness + 1),
          }),
          (map) => HslColor.fromMap(map),
        );
}
