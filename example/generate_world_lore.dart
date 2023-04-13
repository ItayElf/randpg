import 'package:randpg/entities/worlds.dart';

void main() {
  final WorldLoreType loreType = DefaultLore();
  final loreGenerator = WorldLoreGenerator(loreType);

  final WorldLore lore = loreGenerator.generate();
  print(lore.toJson());
}
