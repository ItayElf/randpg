// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:image/image.dart';

import '../../subtypes/world_map/world_map_settings.dart';
import '../../subtypes/world_map/world_map_settings_manager.dart';

/// A class that represents a world map
class WorldMap {
  /// The settings of the world map
  final WorldMapSettings settings;

  /// The image of the world map
  final Image image;

  WorldMap({
    required this.settings,
    required this.image,
  });

  WorldMap copyWith({
    WorldMapSettings? settings,
    Image? image,
  }) {
    return WorldMap(
      settings: settings ?? this.settings,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'settings': settings.getSettingName(),
      'image': base64.encode(encodePng(image)),
    };
  }

  factory WorldMap.fromMap(Map<String, dynamic> map) {
    return WorldMap(
      settings: WorldMapSettingsManager().getType(map['settings']),
      image: decodePng(base64.decode(map['image']))!,
    );
  }

  factory WorldMap.fromShallowMap(Map<String, dynamic> map) => WorldMap(
        settings: map['settings'],
        image: map['image'],
      );

  String toJson() => json.encode(toMap());

  factory WorldMap.fromJson(String source) =>
      WorldMap.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WorldMap(settings: $settings, image: $image)';

  @override
  bool operator ==(covariant WorldMap other) {
    if (identical(this, other)) return true;

    return other.settings == settings && other.image == image;
  }

  @override
  int get hashCode => settings.hashCode ^ image.hashCode;
}
