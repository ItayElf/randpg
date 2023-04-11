import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about orcs
class OrcOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'belligerent hot-heads',
    'scouts for the horde',
    'invading monsters',
    'notoriously savage fury',
    'brutish bullies',
    'thugs and brigands',
    'strong and fierce warriors',
    'brutal and savage',
    'prone to violence and aggression',
    'often mistrustful of other races',
    'fond of battle and conflict',
    'highly territorial and protective of their lands',
    'able to survive in harsh environments',
    'often misunderstood and unfairly judged',
    'possessing a deep sense of honor and loyalty',
    'prone to crude language and behavior',
    'able to form close bonds with members of their own clan',
    'fiercely independent and individualistic',
    'often portrayed as the villains in stories and legends',
    'able to adapt and thrive in a variety of circumstances',
    'often conflicted between their desire for power and their sense of duty to their people',
  ];

  OrcOpinionGenerator() : super(_opinions);
}
