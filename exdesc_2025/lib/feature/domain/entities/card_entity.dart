class CardEntity {
  final String id;
  final String name;
  final int attack;
  final int defense;
  final List<String> series;
  final String imageUrl;

  const CardEntity({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.series,
    required this.imageUrl,
  });
}
