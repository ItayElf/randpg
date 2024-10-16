import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'default/default_emblem_type.dart';
import 'emblem_type.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblem type, make sure to register it or else some features might not work
class EmblemTypeManager extends Manager<EmblemType> {
  const EmblemTypeManager();

  static final Set<EmblemType> _emblemTypes = {
    DefaultEmblemType(),
  };

  static final Set<EmblemType> _activeEmblemTypes = {..._emblemTypes};

  /// Returns all the emblem types
  @override
  List<EmblemType> get allTypes =>
      _emblemTypes.toList()..sortBy((emblemType) => emblemType.getEmblemType());

  /// Returns all active deities
  @override
  List<EmblemType> get activeTypes => _activeEmblemTypes.toList()
    ..sortBy((emblemType) => emblemType.getEmblemType());

  /// Returns the corresponding emblem type from all deities with type [type]
  @override
  EmblemType getType(String type) {
    return _emblemTypes.firstWhere(
      (emblemType) => emblemType.getEmblemType() == type,
      orElse: () => throw EmblemTypeNotFoundException(
          "EmblemType with type $type was not found"),
    );
  }

  /// Adds [emblemType] to the list of all emblem types and active emblem types
  @override
  void registerType(EmblemType emblemType) {
    _emblemTypes.add(emblemType);
    _activeEmblemTypes.add(emblemType);
  }

  /// Removes [emblemType] only from the active races
  @override
  void unregisterType(EmblemType emblemType) {
    _activeEmblemTypes.remove(getType(emblemType.getEmblemType()));
  }

  /// Removes [emblemType] from the active emblem types and from all emblem types list
  @override
  void deleteType(EmblemType emblemType) {
    final foundEmblemType = getType(emblemType.getEmblemType());
    _emblemTypes.remove(foundEmblemType);
    _activeEmblemTypes.remove(foundEmblemType);
  }
}
