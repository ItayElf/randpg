import 'package:radnpg/src/generators/names/races/human/male_human_name_generator.dart';

void main() {
  for (int i = 0; i < 5; i++) {
    print(MaleHumanNameGenerator().generate());
  }
}
