import 'dart:math';

import '../../../entities/emblems/hsl_color.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import 'icons_color_generator.dart';

/// A class that generates better contrasted colors for icons
class IconsColorContrastGenerator implements IGenerator<HslColor> {
  late int _seed;
  final HslColor _primaryColor;
  final HslColor _secondaryColor;

  static const _maxTries = 1000;
  static const _passableRatio = 4.5 / 1;

  IconsColorContrastGenerator(this._primaryColor, this._secondaryColor) {
    _seed = SeedGenerator.generate();
  }

  @override
  HslColor generate() {
    final generator = IconsColorGenerator(_primaryColor);
    int tempSeed = _seed;
    late HslColor color;

    for (int i = 0; i < _maxTries; i++) {
      generator.seed(tempSeed % SeedGenerator.maxSeed);
      color = generator.generate();

      if (_isContrasted(color)) {
        return color;
      }

      tempSeed = (tempSeed * tempSeed) + i;
    }
    return color;
  }

  bool _isContrasted(HslColor color) {
    return _calculateContrast(_primaryColor, color) >= _passableRatio &&
        _calculateContrast(_secondaryColor, color) >= _passableRatio;
  }

  double _calculateContrast(HslColor background, HslColor foreground) {
    final maxLuminance = max(background.luminance, foreground.luminance);
    final minLuminance = min(background.luminance, foreground.luminance);

    return (maxLuminance + 0.05) / (minLuminance + 0.05);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
