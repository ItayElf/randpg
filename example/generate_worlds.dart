import 'package:randpg/entities/worlds.dart';
import 'package:randpg/generators/worlds.dart';
import 'package:randpg/subtypes/worlds.dart';

void main() {
  final WorldSettings settings = DefaultWorldSettings();
  final worldGenerator = WorldGenerator(settings);

  final World world = worldGenerator.generate();
  print(world.toJson());
}
