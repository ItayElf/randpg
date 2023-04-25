import 'dart:convert';

/// A class that wraps an svg
///
/// **NOTE:** this svg wrapper is designed to be simple and used only for this library,
/// thus it is not recommended to use it when in need for an svg library.
class SvgWrapper {
  /// The name of the svg
  final String name;

  /// The content of the svg
  final String content;

  const SvgWrapper({
    required this.name,
    required this.content,
  });

  /// Returns a new svg wrapper with new colors, where the key to the map is the color to replace and the value is the new color
  SvgWrapper recolored(Map<String, String> colorMap) {
    String newContent = content;

    for (final colorPair in colorMap.entries) {
      newContent = newContent
          .replaceAll('fill="${colorPair.key}"', 'fill="${colorPair.value}"')
          .replaceAll('fill:${colorPair.key};', 'fill:${colorPair.value};');
    }

    return SvgWrapper(name: name, content: newContent);
  }

  /// Returns a new svg resized
  SvgWrapper resized({double? width, double? height}) {
    String newContent = content;

    if (width != null) {
      newContent =
          newContent.replaceFirst(RegExp(r'width="\d+"'), 'width="$width"');
    }
    if (height != null) {
      newContent =
          newContent.replaceFirst(RegExp(r'height="\d+"'), 'height="$height"');
    }

    return SvgWrapper(name: name, content: newContent);
  }

  SvgWrapper copyWith({
    String? name,
    String? content,
  }) {
    return SvgWrapper(
      name: name ?? this.name,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'content': content,
    };
  }

  factory SvgWrapper.fromMap(Map<String, dynamic> map) {
    return SvgWrapper(
      name: map['name'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SvgWrapper.fromJson(String source) =>
      SvgWrapper.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SvgWrapper(name: $name, content: $content)';

  @override
  bool operator ==(covariant SvgWrapper other) {
    if (identical(this, other)) return true;

    return other.name == name && other.content == content;
  }

  @override
  int get hashCode => name.hashCode ^ content.hashCode;
}
