import '../../../../enums/gender.dart';
import '../../../../generators/base/constant_generator.dart';
import '../../../../generators/base/generator.dart';
import '../government_type.dart';

/// A class that represents the monarchy government type
class Monarchy implements GovernmentType {
  const Monarchy();

  @override
  String getGovernmentType() => "monarchy";

  @override
  String getLeaderOccupation(Gender gender) {
    switch (gender) {
      case Gender.female:
        return "queen";
      case Gender.male:
        return "king";
    }
  }

  @override
  Generator<int> getNumberOfLeadersGenerator() => ConstantGenerator(1);
}
