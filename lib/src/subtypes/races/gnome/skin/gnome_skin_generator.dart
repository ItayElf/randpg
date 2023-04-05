import '../../../../generators/base/list_item_generator.dart';

/// A class that generates gnomish skin tones
class GnomeSkinGenerator extends ListItemGenerator<String> {
  static const _skinTones = [
    "ruddy tan",
    "woody brown",
    "rocky gray",
    "gray",
    "white",
    "pinkish"
  ];

  GnomeSkinGenerator() : super(_skinTones);
}
