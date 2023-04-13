import 'package:randpg/entities/worlds.dart';

void main() {
  final WorldSettings settings = DefaultWorldSettings();
  final worldGenerator = WorldGenerator(settings);

  final World world = worldGenerator.generate();
  print(world.toJson());
}
