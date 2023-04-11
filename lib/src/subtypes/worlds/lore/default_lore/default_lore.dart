import '../../../../generators/base/generator.dart';
import '../../../../generators/world/lore/gods_fear_generator.dart';
import '../../../../generators/world/lore/gods_plan_generator.dart';
import '../../../../generators/world/lore/world_truth_generator.dart';
import '../world_lore_type.dart';

/// A class that represents the default lore type
class DefaultLore implements WorldLoreType {
  const DefaultLore();

  static const _loreType = "default";

  @override
  IGenerator<String> getEverybodyKnowsGenerator() => WorldTruthGenerator();

  @override
  IGenerator<String> getFewKnowGenerator() => WorldTruthGenerator();

  @override
  IGenerator<String> getGodsFearGenerator() => GodsFearGenerator();

  @override
  IGenerator<String> getGodsPlanGenerator() => GodsPlanGenerator();

  @override
  String getLoreType() => _loreType;

  @override
  IGenerator<String> getNobilityBelievesGenerator() => WorldTruthGenerator();

  @override
  IGenerator<String> getNobodyKnowsGenerator() => WorldTruthGenerator();

  @override
  IGenerator<String> getPeasantsBelieveGenerator() => WorldTruthGenerator();
}
