// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// A class that represents goods that can be found in various locations
class Goods {
  /// The name of the goods
  final String name;

  /// The description of the goods
  final String? description;

  /// The price of the goods, null if there is no price
  final String? price;

  const Goods({
    required this.name,
    this.description,
    this.price,
  });

  Goods copyWith({
    String? name,
    String? description,
    String? price,
  }) {
    return Goods(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Goods.fromMap(Map<String, dynamic> map) {
    return Goods(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Goods.fromJson(String source) =>
      Goods.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Goods(name: $name, description: $description, price: $price)';

  @override
  bool operator ==(covariant Goods other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ price.hashCode;
}
