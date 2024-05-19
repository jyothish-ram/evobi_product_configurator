import 'package:product_configurator_app/data/image_strings.dart';
import 'package:product_configurator_app/models/part_model.dart';

final List<PartModel> parts = [
  PartModel(
    id: '01',
    name: 'Chassis',
    imageUrl: CustomImages.chassisImage,
    imageAssemblyUrl: CustomImages.chassisAssemblyImage,
    description:
        'The iPhone 6s chassis is crafted from 7000 series aluminum, providing durability and a sleek design in four color options.',
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: true,
    availableColor: ['Dark Grey', 'Silver', 'RoseGold'],
    colorImageUrl: [
      CustomImages.chassisDarkGreyImage,
      CustomImages.chassisSilverImage,
      CustomImages.chassisRoseGoldImage
    ],
  ),
  PartModel(
    id: '02',
    name: 'Battery',
    imageUrl: CustomImages.batteryImage,
    imageAssemblyUrl: CustomImages.batteryAssemblyImage,
    description:
        'iPhone 6s features a 1715 mAh non-removable lithium-ion battery, providing ample power for daily use.',
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: false,
    availableColor: null,
    colorImageUrl: null,
  ),
  PartModel(
    id: '03',
    name: 'Motherboard',
    imageUrl: CustomImages.motherboardImage,
    imageAssemblyUrl: CustomImages.motherboardAssemblyImage,
    description:
        "The motherboard features Apple's A9 chip with 64-bit architecture, an embedded M9 motion coprocessor, and supports 2GB of LPDDR4 RAM.",
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: false,
    availableColor: null,
    colorImageUrl: null,
  ),
  PartModel(
    id: '04',
    name: 'Charging Board',
    imageUrl: CustomImages.chargingBoardImage,
    imageAssemblyUrl: CustomImages.chargingBoardAssemblyImage,
    description:
        "The charging board (or Lightning connector assembly) of the iPhone 6s includes the Lightning port for charging and data transfer, the headphone jack, primary microphone, and speaker connections, all integrated into a single flex cable assembly.",
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: false,
    availableColor: null,
    colorImageUrl: null,
  ),
  PartModel(
    id: '05',
    name: 'Camera',
    imageUrl: CustomImages.cameraImage,
    imageAssemblyUrl: CustomImages.cameraAssemblyImage,
    description:
        'iPhone 6s features a 12-megapixel rear camera with an f/2.2 aperture, capable of capturing 4K video, and a 5-megapixel front camera for selfies and FaceTime.',
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: false,
    availableColor: null,
    colorImageUrl: null,
  ),
  PartModel(
    id: '06',
    name: 'Speaker',
    imageUrl: CustomImages.speakerImage,
    imageAssemblyUrl: CustomImages.speakerAssemblyImage,
    description:
        "iPhone 6s has a single bottom-firing speaker for audio playback and speakerphone calls.",
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: false,
    availableColor: null,
    colorImageUrl: null,
  ),
  PartModel(
    id: '07',
    name: 'Retina Display',
    imageUrl: CustomImages.displayImage,
    imageAssemblyUrl: CustomImages.displayAssemblyImage,
    description:
        "iPhone 6s features a 4.7-inch Retina HD display with a resolution of 1334 x 750 pixels, offering crisp visuals and vibrant colors.",
    positionDx: 0.0,
    positionDy: 0.0,
    isColored: true,
    availableColor: ['Black', 'White'],
    colorImageUrl: [
      CustomImages.displayBlackImage,
      CustomImages.displayWhiteImage
    ],
  ),
];
