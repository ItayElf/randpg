import '../../../../generators/base/list_item_generator.dart';

/// A class that generates breeks of dogs
class DogBreedGenerator extends ListItemGenerator<String> {
  static const _breeds = [
    'siberian husky',
    'golden retriever',
    'border collie',
    'german shepherd',
    'labrador retriever',
    'irish wolfhound',
    'shetland sheepdog',
    'cavalier king charles spaniel',
    'australian shepherd',
    'bernese mountain dog',
    'shiba inu',
    'pembroke welsh corgi',
    'great pyrenees',
    'samoyed',
    'alaskan malamute',
    'beagle',
    'dachshund',
    'pomeranian',
    'newfoundland',
    'standard poodle',
    'miniature poodle',
    'toy poodle',
    'border terrier',
    'bull terrier',
    'english bulldog',
    'french bulldog',
    'tibetan mastiff',
    'boxer',
    'pug',
    'chihuahua',
    'papillon',
    'bichon frise',
    'west highland white terrier',
    'cocker spaniel',
    'old english sheepdog',
    'weimaraner',
    'rhodesian ridgeback',
    'akita',
    'saint bernard',
    'dalmatian',
    'vizsla',
    'whippet',
    'italian greyhound',
    'australian cattle dog',
    'basset hound',
    'bloodhound',
    'english setter',
    'german shorthaired pointer',
    'havanese',
    'maltese',
    'shihtzu',
    'border collie',
    'papillon',
    'collie',
    'greyhound'
  ];

  DogBreedGenerator() : super(_breeds);
}
