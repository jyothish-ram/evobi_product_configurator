// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SelectedColorsModel {
  final String id;
  final String colorIndex;
  final String imageUrl;
  final String selectedColor;
  SelectedColorsModel({
    required this.id,
    required this.colorIndex,
    required this.imageUrl,
    required this.selectedColor,
  });

  SelectedColorsModel copyWith({
    String? id,
    String? colorIndex,
    String? imageUrl,
    String? selectedColor,
  }) {
    return SelectedColorsModel(
      id: id ?? this.id,
      colorIndex: colorIndex ?? this.colorIndex,
      imageUrl: imageUrl ?? this.imageUrl,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'colorIndex': colorIndex,
      'imageUrl': imageUrl,
      'selectedColor': selectedColor,
    };
  }

  factory SelectedColorsModel.fromMap(Map<String, dynamic> map) {
    return SelectedColorsModel(
      id: map['id'] as String,
      colorIndex: map['colorIndex'] as String,
      imageUrl: map['imageUrl'] as String,
      selectedColor: map['selectedColor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectedColorsModel.fromJson(String source) =>
      SelectedColorsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SelectedColorsModel(id: $id, colorIndex: $colorIndex, imageUrl: $imageUrl, selectedColor: $selectedColor)';
  }

  @override
  bool operator ==(covariant SelectedColorsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.colorIndex == colorIndex &&
        other.imageUrl == imageUrl &&
        other.selectedColor == selectedColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        colorIndex.hashCode ^
        imageUrl.hashCode ^
        selectedColor.hashCode;
  }
}
