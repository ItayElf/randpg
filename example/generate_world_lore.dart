import 'package:randpg/entities/worlds.dart';
import 'package:randpg/generators/worlds.dart';
import 'package:randpg/subtypes/worlds.dart';

void main() {
  final WorldLoreType loreType = DefaultLore();
  final loreGenerator = WorldLoreGenerator(loreType);

  final WorldLore lore = loreGenerator.generate();
  print(lore.toJson());
}
