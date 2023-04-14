import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';

/// A class that represents a government type
abstract class GovernmentType {
  /// Returns the type of the government
  String getGovernmentType();

  /// Returns the occupation of the leader of the kingdom by their gender
  String getLeaderOccupation(Gender gender);

  /// Returns a generator for how many leaders there are
  IGenerator<int> getNumberOfLeadersGenerator();
}
