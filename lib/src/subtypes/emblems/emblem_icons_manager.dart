import 'package:collection/collection.dart';
import 'package:randpg/src/entities/emblems/svg_wrapper.dart';
import 'package:randpg/src/subtypes/emblems/emblem_data.dart';

import '../../exceptions/not_found_exceptions.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblemIcon type, make sure to register it or else some features might not work
abstract class EmblemIconsManager {
  static final Set<SvgWrapper> _emblemIcons = {...emblemIcons};

  static final Set<SvgWrapper> _activeSvgWrappers = {..._emblemIcons};

  /// Returns all the emblemIcon types
  static List<SvgWrapper> get allIcons =>
      _emblemIcons.toList()..sortBy((emblemIcon) => emblemIcon.name);

  /// Returns all active deities
  static List<SvgWrapper> get activeSvgWrappers =>
      _activeSvgWrappers.toList()..sortBy((emblemIcon) => emblemIcon.name);

  /// Returns the corresponding emblemIcon from all deities with type [name]
  static SvgWrapper getSvgWrapperByName(String name) {
    return _emblemIcons.firstWhere(
      (emblemIcon) => emblemIcon.name == name,
      orElse: () => throw EmblemIconNotFoundException(
          "Emblem icon with name $name was not found"),
    );
  }

  /// Adds [emblemIcon] to the list of all emblemIcon types and active emblemIcon types
  static void registerSvgWrapper(SvgWrapper emblemIcon) {
    _emblemIcons.add(emblemIcon);
    _activeSvgWrappers.add(emblemIcon);
  }

  /// Removes [emblemIcon] only from the active races
  static void unregisterSvgWrapper(SvgWrapper emblemIcon) {
    _activeSvgWrappers.remove(getSvgWrapperByName(emblemIcon.name));
  }

  /// Removes [emblemIcon] from the active emblemIcon types and from all emblemIcon types list
  static void deleteSvgWrapper(SvgWrapper emblemIcon) {
    final foundSvgWrapper = getSvgWrapperByName(emblemIcon.name);
    _emblemIcons.remove(foundSvgWrapper);
    _activeSvgWrappers.remove(foundSvgWrapper);
  }
}
