import 'package:collection/collection.dart';

import '../../../entities/emblems/svg_wrapper.dart';
import '../../../exceptions/not_found_exceptions.dart';
import '../../managers/manager.dart';
import 'emblem_data.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblemIcon type, make sure to register it or else some features might not work
class EmblemIconsManager extends Manager<SvgWrapper> {
  const EmblemIconsManager();

  static final Set<SvgWrapper> _emblemIcons = {...emblemIcons};

  static final Set<SvgWrapper> _activeSvgWrappers = {..._emblemIcons};

  /// Returns all the emblemIcon types
  @override
  List<SvgWrapper> get allTypes =>
      _emblemIcons.toList()..sortBy((emblemIcon) => emblemIcon.name);

  /// Returns all active deities
  @override
  List<SvgWrapper> get activeTypes =>
      _activeSvgWrappers.toList()..sortBy((emblemIcon) => emblemIcon.name);

  /// Returns the corresponding emblemIcon from all deities with type [name]
  @override
  SvgWrapper getType(String name) {
    return _emblemIcons.firstWhere(
      (emblemIcon) => emblemIcon.name == name,
      orElse: () => throw EmblemIconNotFoundException(
          "Emblem icon with name $name was not found"),
    );
  }

  /// Adds [emblemIcon] to the list of all emblemIcon types and active emblemIcon types
  @override
  void registerType(SvgWrapper emblemIcon) {
    _emblemIcons.add(emblemIcon);
    _activeSvgWrappers.add(emblemIcon);
  }

  /// Removes [emblemIcon] only from the active races
  @override
  void unregisterType(SvgWrapper emblemIcon) {
    _activeSvgWrappers.remove(getType(emblemIcon.name));
  }

  /// Removes [emblemIcon] from the active emblemIcon types and from all emblemIcon types list
  @override
  void deleteType(SvgWrapper emblemIcon) {
    final foundSvgWrapper = getType(emblemIcon.name);
    _emblemIcons.remove(foundSvgWrapper);
    _activeSvgWrappers.remove(foundSvgWrapper);
  }
}
