import 'dart:convert';
import 'package:flutter/foundation.dart';

class PartModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isColored;
  final List<String>? availableColor;
  final List<String>? colorImageUrl;
  final String imageAssemblyUrl;
  final String description;
  final double positionDx;
  final double positionDy;

  PartModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isColored,
    required this.availableColor,
    required this.colorImageUrl,
    required this.imageAssemblyUrl,
    required this.description,
    required this.positionDx,
    required this.positionDy,
  });

  PartModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    bool? isColored,
    List<String>? availableColor,
    List<String>? colorImageUrl,
    String? imageAssemblyUrl,
    String? description,
    double? positionDx,
    double? positionDy,
  }) {
    return PartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isColored: isColored ?? this.isColored,
      availableColor: availableColor ?? this.availableColor,
      colorImageUrl: colorImageUrl ?? this.colorImageUrl,
      imageAssemblyUrl: imageAssemblyUrl ?? this.imageAssemblyUrl,
      description: description ?? this.description,
      positionDx: positionDx ?? this.positionDx,
      positionDy: positionDy ?? this.positionDy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isColored': isColored,
      'availableColor': availableColor,
      'colorImageUrl': colorImageUrl,
      'imageAssemblyUrl': imageAssemblyUrl,
      'description': description,
      'positionDx': positionDx,
      'positionDy': positionDy,
    };
  }

  factory PartModel.fromMap(Map<String, dynamic> map) {
    return PartModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      isColored: map['isColored'] as bool,
      availableColor: List<String>.from(map['availableColor'] ?? []),
      colorImageUrl: List<String>.from(map['colorImageUrl'] ?? []),
      imageAssemblyUrl: map['imageAssemblyUrl'] as String,
      description: map['description'] as String,
      positionDx: map['positionDx'] as double,
      positionDy: map['positionDy'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartModel.fromJson(String source) =>
      PartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PartModel(id: $id, name: $name, imageUrl: $imageUrl, isColored: $isColored, availableColor: $availableColor, colorImageUrl: $colorImageUrl, imageAssemblyUrl: $imageAssemblyUrl, description: $description, positionDx: $positionDx, positionDy: $positionDy)';
  }

  @override
  bool operator ==(covariant PartModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.isColored == isColored &&
        listEquals(other.availableColor, availableColor) &&
        listEquals(other.colorImageUrl, colorImageUrl) &&
        other.imageAssemblyUrl == imageAssemblyUrl &&
        other.description == description &&
        other.positionDx == positionDx &&
        other.positionDy == positionDy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        isColored.hashCode ^
        availableColor.hashCode ^
        colorImageUrl.hashCode ^
        imageAssemblyUrl.hashCode ^
        description.hashCode ^
        positionDx.hashCode ^
        positionDy.hashCode;
  }
}
