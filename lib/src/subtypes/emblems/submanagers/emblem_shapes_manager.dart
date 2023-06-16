import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/managers/manager.dart';
import '../../../entities/emblems/svg_wrapper.dart';
import '../../../exceptions/not_found_exceptions.dart';
import 'emblem_data.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblemShape type, make sure to register it or else some features might not work
class EmblemShapesManager extends Manager<SvgWrapper> {
  static final Set<SvgWrapper> _emblemShapes = {...emblemShapes};

  static final Set<SvgWrapper> _activeSvgWrappers = {..._emblemShapes};

  /// Returns all the emblemShape types
  @override
  List<SvgWrapper> get allTypes =>
      _emblemShapes.toList()..sortBy((emblemShape) => emblemShape.name);

  /// Returns all active deities
  @override
  List<SvgWrapper> get activeTypes =>
      _activeSvgWrappers.toList()..sortBy((emblemShape) => emblemShape.name);

  /// Returns the corresponding emblemShape from all deities with type [name]
  @override
  SvgWrapper getType(String name) {
    return _emblemShapes.firstWhere(
      (emblemShape) => emblemShape.name == name,
      orElse: () => throw EmblemShapeNotFoundException(
          "Emblem shape with name $name was not found"),
    );
  }

  /// Adds [emblemShape] to the list of all emblemShape types and active emblemShape types
  @override
  void registerType(SvgWrapper emblemShape) {
    _emblemShapes.add(emblemShape);
    _activeSvgWrappers.add(emblemShape);
  }

  /// Removes [emblemShape] only from the active races
  @override
  void unregisterType(SvgWrapper emblemShape) {
    _activeSvgWrappers.remove(getType(emblemShape.name));
  }

  /// Removes [emblemShape] from the active emblemShape types and from all emblemShape types list
  @override
  void deleteType(SvgWrapper emblemShape) {
    final foundSvgWrapper = getType(emblemShape.name);
    _emblemShapes.remove(foundSvgWrapper);
    _activeSvgWrappers.remove(foundSvgWrapper);
  }
}
