# Randpg <!-- omit in toc -->

[![version](https://img.shields.io/badge/version-0.1.0-green.svg)](https://semver.org)

Randpg is a library for generating random rpg entities like npcs, settlements and even worlds.

## Table of Contents <!-- omit in toc -->

- [Installation](#installation)
- [Features](#features)
- [Usage](#usage)
  - [Generating names](#generating-names)

## Installation

Follow the installation instructions on dart packages.

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
