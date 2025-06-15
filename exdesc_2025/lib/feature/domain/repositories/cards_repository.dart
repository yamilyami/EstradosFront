import '../entities/card_entity.dart';

abstract class CardsRepository {
  Future<List<CardEntity>> getAllCards();
}
