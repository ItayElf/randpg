import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/managers/manager.dart';
import '../../../entities/emblems/svg_wrapper.dart';
import '../../../exceptions/not_found_exceptions.dart';
import './emblem_data.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblemPattern type, make sure to register it or else some features might not work
class EmblemPatternsManager extends Manager<SvgWrapper> {
  const EmblemPatternsManager();

  static final Set<SvgWrapper> _emblemPatterns = {...emblemPatterns};

  static final Set<SvgWrapper> _activeSvgWrappers = {..._emblemPatterns};

  /// Returns all the emblemPattern types
  @override
  List<SvgWrapper> get allTypes =>
      _emblemPatterns.toList()..sortBy((emblemPattern) => emblemPattern.name);

  /// Returns all active deities
  @override
  List<SvgWrapper> get activeTypes => _activeSvgWrappers.toList()
    ..sortBy((emblemPattern) => emblemPattern.name);

  /// Returns the corresponding emblemPattern from all deities with type [name]
  @override
  SvgWrapper getType(String name) {
    return _emblemPatterns.firstWhere(
      (emblemPattern) => emblemPattern.name == name,
      orElse: () => throw EmblemPatternNotFoundException(
          "Emblem pattern with name $name was not found"),
    );
  }

  /// Adds [emblemPattern] to the list of all emblemPattern types and active emblemPattern types
  @override
  void registerType(SvgWrapper emblemPattern) {
    _emblemPatterns.add(emblemPattern);
    _activeSvgWrappers.add(emblemPattern);
  }

  /// Removes [emblemPattern] only from the active races
  @override
  void unregisterType(SvgWrapper emblemPattern) {
    _activeSvgWrappers.remove(getType(emblemPattern.name));
  }

  /// Removes [emblemPattern] from the active emblemPattern types and from all emblemPattern types list
  @override
  void deleteType(SvgWrapper emblemPattern) {
    final foundSvgWrapper = getType(emblemPattern.name);
    _emblemPatterns.remove(foundSvgWrapper);
    _activeSvgWrappers.remove(foundSvgWrapper);
  }
}
