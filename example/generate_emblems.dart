import 'package:randpg/entities/emblems.dart';

void main() {
  final EmblemType type = DefaultEmblemType();
  final emblemGenerator = EmblemGenerator(type);

  final Emblem emblem = emblemGenerator.generate();
  print(emblem.buildSvg());
}
