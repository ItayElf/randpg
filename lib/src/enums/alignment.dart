/// An enum for the first (ethical) part of the alignment
enum EthicalAlignment {
  lawful("lawful"),
  ethicalTrue("true"),
  chaotic("chaotic");

  const EthicalAlignment(this.name);

  final String name;
}

/// An enum for the second (moral) part of the alignment
enum MoralAlignment {
  good("good"),
  neutral("neutral"),
  evil("evil");

  const MoralAlignment(this.name);

  final String name;
}
