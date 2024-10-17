import '../../../entities/npcs/alignment.dart';
import '../../../enums/alignment.dart';
import '../../base/constant_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../npcs/personality/alignment/base_alignment_generator.dart';
import 'deity_domains_data.dart';

/// A class that generates a deity's domain based on their alignment
class DeityDomainGenerator implements Generator<String> {
  late int _seed;
  final Alignment? _alignment;

  DeityDomainGenerator(this._alignment) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final alignmentGenerator = _alignment == null
        ? BaseAlignmentGenerator()
        : ConstantGenerator(_alignment as Alignment);
    alignmentGenerator.seed(_seed);
    final alignment = alignmentGenerator.generate();

    final generator = ListItemGenerator(
        _getEthicalPool(alignment) + _getMoralPool(alignment));
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  static List<String> _getEthicalPool(Alignment alignment) {
    switch (alignment.ethical) {
      case EthicalAlignment.lawful:
        return deityLawfulDomains;
      case EthicalAlignment.ethicalTrue:
        return deityTrueDomains;
      case EthicalAlignment.chaotic:
        return deityChaoticDomains;
    }
  }

  static List<String> _getMoralPool(Alignment alignment) {
    switch (alignment.moral) {
      case MoralAlignment.good:
        return deityGoodDomains;
      case MoralAlignment.neutral:
        return deityNeutralDomains;
      case MoralAlignment.evil:
        return deityEvilDomains;
    }
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
