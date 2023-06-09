import 'dart:convert';

import '../../enums/alignment.dart';

/// A class that represent an alignment of an npc
class Alignment {
  final EthicalAlignment ethical;
  final MoralAlignment moral;

  const Alignment({
    required this.ethical,
    required this.moral,
  });

  Alignment copyWith({
    EthicalAlignment? ethical,
    MoralAlignment? moral,
  }) {
    return Alignment(
      ethical: ethical ?? this.ethical,
      moral: moral ?? this.moral,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ethical': ethical.name,
      'moral': moral.name,
    };
  }

  factory Alignment.fromMap(Map<String, dynamic> map) {
    return Alignment(
      ethical: EthicalAlignment.fromName(map['ethical']),
      moral: MoralAlignment.fromName(map['moral']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Alignment.fromJson(String source) =>
      Alignment.fromMap(json.decode(source));

  @override
  String toString() => 'Alignment(ethical: $ethical, moral: $moral)';

  @override
  bool operator ==(covariant Alignment other) {
    if (identical(this, other)) return true;

    return other.ethical == ethical && other.moral == moral;
  }

  @override
  int get hashCode => ethical.hashCode ^ moral.hashCode;
}
