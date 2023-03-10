import 'package:radnpg/generators/names/races.dart';

void main() {
  for (int i = 0; i < 5; i++) {
    print(HumanNameGenerator(true).generate());
    print(HumanNameGenerator(false).generate());
  }
}
