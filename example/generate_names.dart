import 'package:radnpg/src/generators/names/races/human/human_name_generator.dart';

void main() {
  for (int i = 0; i < 5; i++) {
    print(HumanNameGenerator(true).generate());
    print(HumanNameGenerator(false).generate());
  }
}
