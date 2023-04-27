import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import 'emblem_type.dart';

/// A class that handles the available deities and using them
///
/// When making a custom emblem type, make sure to register it or else some features might not work
abstract class EmblemTypeManager {
  static final Set<EmblemType> _emblemTypes = {};

  static final Set<EmblemType> _activeEmblemTypes = {..._emblemTypes};

  /// Returns all the emblem types
  static List<EmblemType> get allDeities =>
      _emblemTypes.toList()..sortBy((emblemType) => emblemType.getEmblemType());

  /// Returns all active deities
  static List<EmblemType> get activeEmblemTypes => _activeEmblemTypes.toList()
    ..sortBy((emblemType) => emblemType.getEmblemType());

  /// Returns the corresponding emblem type from all deities with type [type]
  static EmblemType getEmblemTypeByType(String type) {
    return _emblemTypes.firstWhere(
      (emblemType) => emblemType.getEmblemType() == type,
      orElse: () => throw EmblemTypeNotFoundException(
          "EmblemType with type $type was not found"),
    );
  }

  /// Adds [emblemType] to the list of all emblem types and active emblem types
  static void registerEmblemType(EmblemType emblemType) {
    _emblemTypes.add(emblemType);
    _activeEmblemTypes.add(emblemType);
  }

  /// Removes [emblemType] only from the active races
  static void unregisterEmblemType(EmblemType emblemType) {
    _activeEmblemTypes.remove(getEmblemTypeByType(emblemType.getEmblemType()));
  }

  /// Removes [emblemType] from the active emblem types and from all emblem types list
  static void deleteEmblemType(EmblemType emblemType) {
    final foundEmblemType = getEmblemTypeByType(emblemType.getEmblemType());
    _emblemTypes.remove(foundEmblemType);
    _activeEmblemTypes.remove(foundEmblemType);
  }
}
