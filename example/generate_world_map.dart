import 'package:randpg/entities/world_map.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generate a world map
  final randomSetting =
      ListItemGenerator(WorldMapSettingsManager().activeTypes).generate();
  final generator = WorldMapGenerator(randomSetting, 100, 100);
  final worldMap = generator.generate();

  print(
      "${randomSetting.getSettingName()} world:\ndata:image/png;base64,${worldMap.toMap()['image']}");
}
