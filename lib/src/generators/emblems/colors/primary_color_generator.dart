import '../../../entities/emblems/hsl_color.dart';
import '../../base/batch_generator.dart';
import '../../base/future_generator.dart';
import '../../base/number_generator.dart';

class PrimaryColorGenerator
    extends FutureGenerator<HslColor, Map<String, dynamic>> {
  static const minHue = 0;
  static const maxHue = 360;

  static const minSaturation = 0;
  static const maxSaturation = 50;

  static const minLightness = 30;
  static const maxLightness = 70;

  PrimaryColorGenerator()
      : super(
          BatchGenerator({
            "h": NumberGenerator(minHue, maxHue + 1),
            "s": NumberGenerator(minSaturation, maxSaturation + 1),
            "l": NumberGenerator(minLightness, maxLightness + 1),
          }),
          (map) => HslColor.fromMap(map),
        );
}
