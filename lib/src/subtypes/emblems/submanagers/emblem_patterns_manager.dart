import 'package:collection/collection.dart';
import '../../../entities/emblems/svg_wrapper.dart';
import '../../../exceptions/not_found_exceptions.dart';
import './emblem_data.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblemPattern type, make sure to register it or else some features might not work
abstract class EmblemPatternsManager {
  static final Set<SvgWrapper> _emblemPatterns = {...emblemPatterns};

  static final Set<SvgWrapper> _activeSvgWrappers = {..._emblemPatterns};

  /// Returns all the emblemPattern types
  static List<SvgWrapper> get allPatterns =>
      _emblemPatterns.toList()..sortBy((emblemPattern) => emblemPattern.name);

  /// Returns all active deities
  static List<SvgWrapper> get activeSvgWrappers => _activeSvgWrappers.toList()
    ..sortBy((emblemPattern) => emblemPattern.name);

  /// Returns the corresponding emblemPattern from all deities with type [name]
  static SvgWrapper getSvgWrapperByName(String name) {
    return _emblemPatterns.firstWhere(
      (emblemPattern) => emblemPattern.name == name,
      orElse: () => throw EmblemPatternNotFoundException(
          "Emblem pattern with name $name was not found"),
    );
  }

  /// Adds [emblemPattern] to the list of all emblemPattern types and active emblemPattern types
  static void registerSvgWrapper(SvgWrapper emblemPattern) {
    _emblemPatterns.add(emblemPattern);
    _activeSvgWrappers.add(emblemPattern);
  }

  /// Removes [emblemPattern] only from the active races
  static void unregisterSvgWrapper(SvgWrapper emblemPattern) {
    _activeSvgWrappers.remove(getSvgWrapperByName(emblemPattern.name));
  }

  /// Removes [emblemPattern] from the active emblemPattern types and from all emblemPattern types list
  static void deleteSvgWrapper(SvgWrapper emblemPattern) {
    final foundSvgWrapper = getSvgWrapperByName(emblemPattern.name);
    _emblemPatterns.remove(foundSvgWrapper);
    _activeSvgWrappers.remove(foundSvgWrapper);
  }
}
