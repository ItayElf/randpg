import '../../../../enums/gender.dart';
import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/generator.dart';
import '../government_type.dart';

/// A class that represents the confederacy government type
class Federation implements GovernmentType {
  const Federation();

  @override
  String getGovernmentType() => "federation";

  @override
  String getLeaderOccupation(Gender gender) => "president";

  @override
  Generator<int> getNumberOfLeadersGenerator() => ConstantGenerator(1);
}
