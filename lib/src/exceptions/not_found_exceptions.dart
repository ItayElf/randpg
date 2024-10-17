import 'base_exceptions.dart';

/// An exception that is thrown when a not supported race is being used
class RaceNotFoundException extends RandpgException {
  const RaceNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "RaceNotFoundException";
}

/// An exception that is thrown when a not supported gender is being used
class GenderNotSupportedException extends RandpgException {
  const GenderNotSupportedException([super.msg]);

  @override
  String toString() => msg ?? "GenderNotSupportedException";
}

/// An exception that is thrown when a not supported locationType is being used
class LocationTypeNotFoundException extends RandpgException {
  const LocationTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "LocationTypeNotFoundException";
}

/// An exception that is thrown when a not supported settlementType is being used
class SettlementTypeNotFoundException extends RandpgException {
  const SettlementTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "SettlementTypeNotFoundException";
}

/// An exception that is thrown when a not supported landscapeType is being used
class LandscapeTypeNotFoundException extends RandpgException {
  const LandscapeTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "LandscapeTypeNotFoundException";
}

/// An exception that is thrown when a not supported deityType is being used
class DeityTypeNotFoundException extends RandpgException {
  const DeityTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "DeityTypeNotFoundException";
}

/// An exception that is thrown when a not supported loreType is being used
class WorldLoreTypeNotFoundException extends RandpgException {
  const WorldLoreTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "WorldLoreTypeNotFoundException";
}

/// An exception that is thrown when a not supported loreType is being used
class WorldSettingsNotFoundException extends RandpgException {
  const WorldSettingsNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "WorldSettingsNotFoundException";
}

/// An exception that is thrown when a not supported guildType is being used
class GuildTypeNotFoundException extends RandpgException {
  const GuildTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "GuildTypeNotFoundException";
}

/// An exception that is thrown when a not supported governmentType is being used
class GovernmentTypeNotFoundException extends RandpgException {
  const GovernmentTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "GovernmentTypeNotFoundException";
}

/// An exception that is thrown when a not supported kingdomType is being used
class KingdomTypeNotFoundException extends RandpgException {
  const KingdomTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "KingdomTypeNotFoundException";
}

/// An exception that is thrown when a not supported emblem shape is being used
class EmblemShapeNotFoundException extends RandpgException {
  const EmblemShapeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "EmblemShapeNotFoundException";
}

/// An exception that is thrown when a not supported emblem pattern is being used
class EmblemPatternNotFoundException extends RandpgException {
  const EmblemPatternNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "EmblemPatternNotFoundException";
}

/// An exception that is thrown when a not supported emblem icon is being used
class EmblemIconNotFoundException extends RandpgException {
  const EmblemIconNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "EmblemIconNotFoundException";
}

/// An exception that is thrown when a not supported emblem type is being used
class EmblemTypeNotFoundException extends RandpgException {
  const EmblemTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "EmblemTypeNotFoundException";
}

/// An exception that is thrown when a not supported companionType is being used
class CompanionTypeNotFoundException extends RandpgException {
  const CompanionTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "CompanionTypeNotFoundException";
}

/// An exception that is thrown when a not supported holidayType is being used
class HolidayTypeNotFoundException extends RandpgException {
  const HolidayTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "HolidayTypeNotFoundException";
}
