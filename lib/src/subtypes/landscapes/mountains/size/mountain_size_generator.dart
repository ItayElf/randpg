import '../../../../generators/base/list_item_generator.dart';

/// A class that generates mountain sizes
class MountainSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    'span hundreds of meters in length',
    'cover a vast area of the continent',
    'rise to a towering height of several meters',
    'extend as far as the eye can see in either direction',
    'are one of the highest mountain ranges on the continent',
    'are a relatively low-lying mountain range',
    'are a moderately sized mountain range',
    'tower over nearby landscapes, dominating the horizon',
    'are incredibly narrow and steep, with little room for foothills',
    'span several different countries or territories',
    'are home to the tallest mountain in the world',
    'have a gentle, gradual slope that leads to a plateau at the summit',
    'are split into several distinct sub-ranges or clusters of mountains',
  ];

  MountainSizeGenerator() : super(_sizes);
}
