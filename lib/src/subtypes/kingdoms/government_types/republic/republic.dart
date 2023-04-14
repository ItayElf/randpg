import '../../../../enums/gender.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../government_type.dart';

/// A class that represents the republic government type
class Republic implements GovernmentType {
  const Republic();

  static const _minCouncilSize = 3;
  static const _maxCouncilSize = 7;

  @override
  String getGovernmentType() => "republic";

  @override
  String getLeaderOccupation(Gender gender) => "councilor";

  @override
  IGenerator<int> getNumberOfLeadersGenerator() =>
      NumberGenerator(_minCouncilSize, _maxCouncilSize + 1);
}
