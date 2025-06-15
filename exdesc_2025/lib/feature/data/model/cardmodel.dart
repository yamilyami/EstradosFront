import '../../domain/entities/card_entity.dart';

class CardModel {
  final String id;
  final String name;
  final int attack;
  final int defense;
  final List<String> series;
  final String imageUrl;

  CardModel({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.series,
    required this.imageUrl,
  });

  factory CardModel.fromJson(Map<String, dynamic> json, String id) {
    return CardModel(
      id: id,
      name: json['name'],
      attack: json['attack'],
      defense: json['defense'],
      series: List<String>.from(json['series']),
      imageUrl: json['imageUrl'],
    );
  }

  /// 🔄 Transforma CardModel en CardEntity
  CardEntity toEntity() {
    return CardEntity(
      id: id,
      name: name,
      attack: attack,
      defense: defense,
      series: series,
      imageUrl: imageUrl,
    );
  }
}
