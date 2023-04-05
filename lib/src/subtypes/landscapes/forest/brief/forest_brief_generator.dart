import '../../../../generators/base/list_item_generator.dart';

/// A class that generates briefs for forests
class ForestBriefGenerator extends ListItemGenerator<String> {
  static const _briefs = [
    "has exceptionally tall trees",
    "is covered by moss",
    "is shadowed by the trees",
    "has trees with twisted trunks",
    "has small streams of water",
    "has leafless trees",
    "has trees that glow softly in the dark.",
    "is dense and shadowy, is shrouded in darkness, with little light penetrating through the thick canopy of trees",
    "has twisted, gnarled trees with red sap that seems to drip like blood from the bark",
    "has grown wild and untamed, with thorns and brambles covering the forest floor and vines twisting around tree trunks",
    "has trees which seem to sing with the breeze, and the air is filled with a soft, haunting melody",
    "has trees which are alive and imbued with elemental magic, and the creatures that dwell within are closely connected to nature",
    "has trees which seem to whisper secrets to those who wander beneath their boughs, and the air is always filled with a soft, eerie rustling",
    "is a forest that seems to shift and move on its own, with trees that twist and turn like living things and paths that seem to lead in circles",
  ];

  ForestBriefGenerator() : super(_briefs);
}
