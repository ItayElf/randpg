import '../../entities/emblems/hsl_color.dart';
import '../../entities/emblems/icon_position.dart';
import '../../entities/emblems/svg_wrapper.dart';
import '../../generators/base/generator.dart';

/// A class that represents an emblem type
abstract class EmblemType {
  /// Returns the type of the emblem
  String getEmblemType();

  /// Returns a generator for a shape of an emblem
  Generator<SvgWrapper> getShapeGenerator();

  /// Returns a generator for a pattern of an emblem
  Generator<SvgWrapper> getPatternGenerator();

  /// Returns a generator for an icon for this generator
  Generator<SvgWrapper> getIconGenerator();

  /// Returns a generator for how many icons an emblem has
  Generator<int> getIconsCountGenerator();

  /// Returns a generator for the layout of the icons based on how many there are
  Generator<List<IconPosition>> getLayoutGenerator(int iconsCount);

  /// Returns a generator for the primary color of the emblem
  Generator<HslColor> getPrimaryColorGenerator();

  /// Returns a generator for the secondary color of the emblem
  Generator<HslColor> getSecondaryColorGenerator(HslColor primaryColor);

  /// Returns a generator for the icon color of the emblem
  Generator<HslColor> getIconsColorGenerator(
      HslColor primaryColor, HslColor secondaryColor);
}
