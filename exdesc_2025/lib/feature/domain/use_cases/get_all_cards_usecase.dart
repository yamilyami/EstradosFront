import '../entities/card_entity.dart';
import '../repositories/cards_repository.dart';

class GetAllCardsUseCase {
  final CardsRepository repository;

  GetAllCardsUseCase(this.repository);

  Future<List<CardEntity>> call() async {
    return await repository.getAllCards();
  }
}
