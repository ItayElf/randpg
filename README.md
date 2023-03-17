# Randpg <!-- omit in toc -->

Randpg is a library for generating random rpg entities like npcs, settlements and even worlds.

## Table of Contents <!-- omit in toc -->

- [Features](#features)
- [Usage](#usage)
  - [Generating names](#generating-names)


## Features

* Generating names for various races

## Usage

### Generating names

```dart
final bool isMale = true; // true for male, false for female
final Race race = Race.halfling; // or any other race
final nameGenerator = RaceNameGenerator(isMale, race);

// if you want to seed the generator:
nameGenerator.seed(1234)

print(nameGenerator.generate()) // expected output: "cormin shadowheart" (output might be different since dart random seed is different on different machines)
```
