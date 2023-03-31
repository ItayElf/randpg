/// An enum for the first (ethical) part of the alignment
enum EthicalAlignment {
  lawful("lawful"),
  ethicalTrue("true"),
  chaotic("chaotic");

  const EthicalAlignment(this.name);

  factory EthicalAlignment.fromName(String name) {
    return EthicalAlignment.values
        .where((element) => element.name == name)
        .first;
  }

  final String name;
}

/// An enum for the second (moral) part of the alignment
enum MoralAlignment {
  good("good"),
  neutral("neutral"),
  evil("evil");

  const MoralAlignment(this.name);

  factory MoralAlignment.fromName(String name) {
    return MoralAlignment.values.where((element) => element.name == name).first;
  }

  final String name;
}
