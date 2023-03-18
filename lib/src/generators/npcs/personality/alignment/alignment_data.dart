import 'package:randpg/src/enums/alignment.dart';

import '../../../../enums/race.dart';

const Map<EthicalAlignment, int> genericEthicalMap = {
  EthicalAlignment.chaotic: 1,
  EthicalAlignment.ethicalTrue: 1,
  EthicalAlignment.lawful: 1,
};

const Map<EthicalAlignment, int> chaoticEthicalMap = {
  EthicalAlignment.chaotic: 5,
  EthicalAlignment.ethicalTrue: 1
};

const Map<EthicalAlignment, int> lawfulEthicalMap = {
  EthicalAlignment.lawful: 5,
  EthicalAlignment.ethicalTrue: 1,
};

const Map<EthicalAlignment, int> neutralEthicalMap = {
  EthicalAlignment.chaotic: 1,
  EthicalAlignment.ethicalTrue: 5,
  EthicalAlignment.lawful: 1,
};

const Map<MoralAlignment, int> genericMoralMap = {
  MoralAlignment.evil: 1,
  MoralAlignment.good: 1,
  MoralAlignment.neutral: 1,
};

const Map<MoralAlignment, int> goodMoralMap = {
  MoralAlignment.good: 5,
  MoralAlignment.neutral: 1,
};

const Map<MoralAlignment, int> evilMoralMap = {
  MoralAlignment.evil: 5,
  MoralAlignment.neutral: 1,
};

const ethicalMap = {
  [Race.elf, Race.orc, Race.tiefling]: chaoticEthicalMap,
  [Race.gnome]: neutralEthicalMap,
  [Race.halfling]: lawfulEthicalMap,
};

const moralMap = {
  [Race.gnome, Race.halfling]: goodMoralMap,
  [Race.orc]: evilMoralMap,
};
