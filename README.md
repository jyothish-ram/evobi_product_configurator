# Product Configurator App

A Product Configurator Flutter App devoloped for Evobi Automations.

## Table of Contents

- [Introduction](#introduction)
- [Objective](#objective)
- [Notes](#notes)
- [Download](#download)
- [Installation](#installation)
- [App Screenshots](#app-screenshots)
- [Project Structure](#project-structure)



## Introduction

This App is Iphone 6s Phone Assembler part by part Configurator devoloped using flutter.

## Objective

1. Think of any product that can be broken into a minimum of 5 different main parts. Example: a cycle has parts like wheels, frame, seat, handle, mudguard, and side stand. This app focuses on the iPhone 6s.
2. **1st screen**: A textual product description page showing the whole product image and a "START" button. On clicking start, the 2nd screen is shown.
3. **2nd screen**: All parts are given as a scrollable (horizontal scroll) list with part images and names below the image in a card view. Parts can be selected for assembling. This screen is like a shopping cart. The selected parts are highlighted or have a checkbox. The user can select all or at least 3 parts from the list.
4. **3rd screen**: A Drag-N-Drop method to assemble the parts at the center of the screen to form the product. The selected parts are shown on the left side in a vertically scrollable panel. The user doesn't need to complete the entire product; partial assembly is accepted.
5. **4th screen**: The assembled parts are displayed as is. The user can add colors to each part separately, either from a color palette or from at least 4 color options. Each part's color can be applied separately.
6. **5th screen**: The final product view shows the assembled and colored parts.


## Notes

> [!NOTE]
> Selected Product is iPhone 6s
> - Has a maximum of 7 parts (must select at least 3 parts)
> - Has parts with color variation:
>   - Chassis [4]
>   - Display [3]

> [!WARNING]
> [x] Due lack of proper svg files, full color palette implementation of parts coloring wasn't completed.

## Download

You can download the latest version of the APK from the [Releases](https://github.com/jyothishram/evobi_product_configurator/releases) page.

![Download APK](https://github.com/jyothishram/evobi_product_configurator/releases/tag/v1.0.1)

## Installation

> [!TIP]
> - After Installing Flutter
> - Clone this repository

```
cd product_configurator
flutter run
```

## App Screenshots

>1.Start Screen:

![StartScreen](documentation/images/screen1.png)

>2.Parts Selection Screen:

![Parts Selection Screen](documentation/images/screen2.png)

>3.Parts Assembly Screen:

![Parts Assembly Screen](documentation/images/screen3.png)

>4.Parts Color Selection Screen:

![Parts Color Selection Screen](documentation/images/screen4.png)

>5.Final Product Screen:

![Final Product Screen](documentation/images/screen5.png)

## Project Structure

```plaintext
product_configurator/
├── assets/
│   ├── font/
│   └── images/
│       ├── model/
│       ├── parts/  (contains parts thumbnail images)
│       ├── partsAssembly/  (contains parts assembly images)
│       └── partsColoredAssembly/  (contains colored parts assembly images)
├── lib/
│   ├── main.dart
│   ├── data/
│   │   ├── image_strings.dart  (contains all assets images paths and links)
│   │   ├── parts_data.dart  (contains data about parts. modify to add new parts)
│   │   └── text_strings.dart  (contains all text strings in the App)
│   ├── models/
│   │   └── (contains models like part model)
│   ├── screens/
│   │   └── (contains all five screens)
│   ├── utils/
│   └── widgets/
└── pubspec.yaml
```

> [!TIP]
> - You can add images for new parts in the `assets/images` directory.
> - Modify `parts_data.dart`, `image_strings.dart` and `text_strings.dart` to include new parts.