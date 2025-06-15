import 'package:equatable/equatable.dart';
import 'package:exdesc_2025/feature/domain/entities/card_entity.dart';
//import 'package:exdesc_2025/feature/cards/domain/entities/card_entity.dart';

abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object> get props => [];
}

class CardsInitialState extends CardsState {}

class CardsLoadingState extends CardsState {}

class CardsLoadedState extends CardsState {
  final List<CardEntity> cards;

  const CardsLoadedState(this.cards);

  @override
  List<Object> get props => [cards];
}

class CardsErrorState extends CardsState {
  final String message;

  const CardsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
