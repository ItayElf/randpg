import '../../../entities/npcs/alignment.dart';
import '../../../enums/alignment.dart';
import '../../base/list_item_generator.dart';
import 'deity_domains_data.dart';

class DeityDomainGenerator extends ListItemGenerator<String> {
  DeityDomainGenerator(Alignment alignment)
      : super(_getEthicalPool(alignment) + _getMoralPool(alignment));

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
}
