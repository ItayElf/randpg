# Changelog

## 0.9.6

- Added races:
  - Goblins
  - Shifters

## 0.9.5 (Hotfix)

- Exported the `Manager<T>` class

## 0.9.4

- Made all managers conform to the `Manager<T>` class

## 0.9.3

- Removed casting in json methods for entities

## 0.9.2

- Fixed capital and important settlement mismatch in the default kingdom type

- Fixed all kingdoms having the same government in world generation

- Added more special features for npcs

## 0.9.1

- Fixed example svg not showing

- Downgraded the collections package version to work with Flutter

## 0.9.0

- Added emblem generation

- Added emblem to kingdoms and guilds

## 0.8.2

- Added adjective to races

- Fixed some of the descriptions of some entities

- Added government type as an argument for kingdom generator

## 0.8.1

- Changed descriptor generator to be based on alignment

- Added max tries to unique generator

## 0.8.0

- Added kingdoms

- Switched settlements for kingdoms in world entity

- Added government types

  - Federation
  - Monarchy
  - Republic
  - Theocracy

- Added custom settlement names for races
  - Dwarf
  - Elf
  - Orc

## 0.7.0

- Added guilds

  - Thieves guilds
  - Merchants guilds
  - Knights orders
  - Mages guilds
  - Druid circles
  - Artisan guilds
  - Cults

- Made cleaner exports

- Added guilds to world entity

- Added better names for monuments

- Added base generators
  - RepeatedGenerator

## 0.6.0

- Added world generation

- Added opinions to race interface

- Added deities

  - Primordials

- Improved the seeding of the base generators

## 0.5.2

- Added automated publishing

## 0.5.1

- Made changes in order to upload the package
  - Changes examples to example
  - Removed unused imports

## 0.5.0

- Added deities

  - Gods
  - Demigods
  - Demon Lords
  - Archangels

- Added `Fixable<T>` interface that allows fixing an object after generation
- Exported generators for custom landscape types

## 0.4.0

- Added landscapes

  - Forests
  - Mountains
  - Swamps
  - Rivers
  - Deserts
  - Oceans
  - Tundras
  - Steppes

- Made all managers return sorted lists

## 0.3.1

- Fixed two occurrences of races folder due to previous conflicts

## 0.3.0

- Added settlements

  - Hamlets
  - Villages
  - Towns
  - Cities
  - Metropolises

- Added locations

  - General Shops
  - Taverns
  - Smithies
  - Temples
  - Libraries
  - Monuments

- Added base generators
  - FutureGenerator
  - ListBatchGenerator

## 0.2.0

- Added physical description generator
- Added personality generator
- Made races an interface rather than an enum
- Added an npc generator

## 0.1.1

- Changed gender from bool to enum

## 0.1.0

- Added name generation for:
  - Dwarfs
  - Dragonborns
  - Elves
  - Gnomes
  - Half-Elves
  - Halflings
  - Humans
  - Orcs
  - Tieflings

## 0.0.0

- Started working on the package
