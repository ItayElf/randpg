# Randpg <!-- omit in toc -->

[![version](https://img.shields.io/badge/version-0.2.0-green.svg)](https://semver.org)

Randpg is a library for generating random rpg entities like npcs, settlements and even worlds.

## Table of Contents <!-- omit in toc -->

- [Installation](#installation)
- [Features](#features)
- [Goals](#goals)
- [Usage](#usage)
  - [Generating names](#generating-names)

## Installation

Follow the installation instructions on dart packages.

## Features

* Generating names for various races
* Generate npc data:
  * Physical description
  * Personality generator

## Goals

-  Npc generator
- Settlement generator
- Landscape generator
- Gods generator
- World generator

## Usage

### Generating names

Generating a male halfling name as an example:

```dart
final Gender gender = Gender.male; 
final Race race = Race.halfling; 
final nameGenerator = RaceNameGenerator(gender, race);

// if you want to seed the generator:
nameGenerator.seed(1234);

print(nameGenerator.generate()); // expected output: "cormin shadowheart"
```
*output might be different since dart random seed is different on different machines* 