import '../../../entities/emblems/hsl_color.dart';
import '../../../entities/emblems/icon_position.dart';
import '../../../entities/emblems/svg_wrapper.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/weighted_generator.dart';
import '../../../generators/emblems/colors/icons_color_contrast_generator.dart';
import '../../../generators/emblems/colors/primary_color_generator.dart';
import '../../../generators/emblems/colors/secondary_color_generator.dart';
import '../../../generators/emblems/layouts/layout_generator.dart';
import '../emblem_type.dart';
import '../submanagers/emblem_icons_manager.dart';
import '../submanagers/emblem_patterns_manager.dart';
import '../submanagers/emblem_shapes_manager.dart';

/// A class that represents the base emblem type
class DefaultEmblemType implements EmblemType {
  const DefaultEmblemType();

  static const _emblemType = "default";

  @override
  String getEmblemType() => _emblemType;

  @override
  IGenerator<SvgWrapper> getIconGenerator() =>
      ListItemGenerator(EmblemIconsManager.activeSvgWrappers);

  @override
  IGenerator<List<IconPosition>> getLayoutGenerator(int iconsCount) =>
      LayoutGenerator(iconsCount);

  @override
  IGenerator<HslColor> getIconsColorGenerator(
          HslColor primaryColor, HslColor secondaryColor) =>
      IconsColorContrastGenerator(primaryColor, secondaryColor);

  @override
  IGenerator<int> getIconsCountGenerator() =>
      WeightedGenerator({0: 1, 1: 3, 2: 3, 3: 3, 4: 3});

  @override
  IGenerator<SvgWrapper> getPatternGenerator() =>
      ListItemGenerator(EmblemPatternsManager.activeSvgWrappers);

  @override
  IGenerator<HslColor> getPrimaryColorGenerator() => PrimaryColorGenerator();

  @override
  IGenerator<HslColor> getSecondaryColorGenerator(HslColor primaryColor) =>
      SecondaryColorGenerator(primaryColor);

  @override
  IGenerator<SvgWrapper> getShapeGenerator() =>
      ListItemGenerator(EmblemShapesManager.activeSvgWrappers);
}
