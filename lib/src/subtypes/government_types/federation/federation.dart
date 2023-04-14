import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../government_type.dart';

/// A class that represents the confederacy government type
class Federation implements GovernmentType {
  const Federation();

  @override
  String getGovernmentType() => "federation";

  @override
  String getLeaderOccupation(Gender gender) => "president";

  @override
  IGenerator<int> getNumberOfLeadersGenerator() => ListItemGenerator([1]);
}
