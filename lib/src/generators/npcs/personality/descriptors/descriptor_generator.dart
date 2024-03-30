import '../../../../entities/npcs/alignment.dart';
import '../../../../enums/alignment.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'descriptors_data.dart';

/// A generator for characters descriptors
class DescriptorGenerator implements Generator<String> {
  late int _seed;
  final Alignment _alignment;

  DescriptorGenerator(this._alignment) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = ListItemGenerator(
        _getEthicalPool(_alignment) + _getMoralPool(_alignment));
    generator.seed(_seed);
    return generator.generate();
  }

  static List<String> _getEthicalPool(Alignment alignment) {
    switch (alignment.ethical) {
      case EthicalAlignment.lawful:
        return npcLawfulDescriptors;
      case EthicalAlignment.ethicalTrue:
        return npcTrueDescriptors;
      case EthicalAlignment.chaotic:
        return npcChaoticDescriptors;
    }
  }

  static List<String> _getMoralPool(Alignment alignment) {
    switch (alignment.moral) {
      case MoralAlignment.good:
        return npcGoodDescriptors;
      case MoralAlignment.neutral:
        return npcNeutralDescriptors;
      case MoralAlignment.evil:
        return npcEvilDescriptors;
    }
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
