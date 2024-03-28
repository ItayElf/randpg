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
  Generator<String> getEverybodyKnowsGenerator() => WorldTruthGenerator();

  @override
  Generator<String> getFewKnowGenerator() => WorldTruthGenerator();

  @override
  Generator<String> getGodsFearGenerator() => GodsFearGenerator();

  @override
  Generator<String> getGodsPlanGenerator() => GodsPlanGenerator();

  @override
  String getLoreType() => _loreType;

  @override
  Generator<String> getNobilityBelievesGenerator() => WorldTruthGenerator();

  @override
  Generator<String> getNobodyKnowsGenerator() => WorldTruthGenerator();

  @override
  Generator<String> getPeasantsBelieveGenerator() => WorldTruthGenerator();
}
