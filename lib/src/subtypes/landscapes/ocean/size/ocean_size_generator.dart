import '../../../../generators/base/list_item_generator.dart';

/// A class that generates ocean sizes
class OceanSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    'is one of the largest oceans on the planet',
    'is one of the smallest oceans on the planet',
    'is so vast that it spans multiple continents',
    'is a relatively small sea',
    'is a narrow strait connecting two larger bodies of water',
    'is a broad gulf that stretches for hundreds of kilometers',
    'is a relatively shallow sea with an average depth of less than 100 meters',
    'is one of the deepest seas in the world with depths exceeding 10,000 meters',
    'is a deep, cold trench that supports unique deep-sea creatures',
    'is an isolated inlet accessible only by boat',
    'is a winding, serpentine river with numerous rapids and waterfalls',
    "is a massive ocean that covers nearly a third of the planet's surface",
    "is a small bay that is sheltered from the open sea",
    "is a wide sound that separates two land masses",
    "is a long and winding canal that connects two bodies of water",
    "is a large sea",
    "is a small cove that is hidden away from the open ocean",
    "is a vast expanse of open water",
    "is a narrow inlet that leads to a secluded harbor",
    "is a deep and turbulent strait that poses a challenge to even the most experienced sailors",
    "is a massive inland sea that borders several different countries",
    "is a broad and shallow bay that is ideal for swimming and water sports",
  ];

  OceanSizeGenerator() : super(_sizes);
}
