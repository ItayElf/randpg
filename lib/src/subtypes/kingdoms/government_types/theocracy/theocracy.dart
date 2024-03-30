import '../../../../enums/gender.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/number_generator.dart';
import '../government_type.dart';

/// A class that represents the theocracy government type
class Theocracy implements GovernmentType {
  const Theocracy();

  static const _minCouncilSize = 1;
  static const _maxCouncilSize = 3;

  @override
  String getGovernmentType() => "theocracy";

  @override
  String getLeaderOccupation(Gender gender) {
    switch (gender) {
      case Gender.male:
        return "high priest";
      case Gender.female:
        return "high priestess";
    }
  }

  @override
  Generator<int> getNumberOfLeadersGenerator() =>
      NumberGenerator(_minCouncilSize, _maxCouncilSize + 1);
}
