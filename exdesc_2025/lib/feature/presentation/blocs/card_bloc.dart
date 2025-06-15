import 'package:exdesc_2025/feature/domain/use_cases/get_all_cards_usecase.dart';
import 'package:exdesc_2025/feature/presentation/blocs/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cards_event.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final GetAllCardsUseCase getAllCardsUseCase;

  CardsBloc(this.getAllCardsUseCase) : super(CardsInitialState()) {
    on<LoadCardsEvent>((event, emit) async {
      emit(CardsLoadingState());
      try {
        final cards = await getAllCardsUseCase();
        emit(CardsLoadedState(cards));
      } catch (e) {
        emit(CardsErrorState(e.toString()));
      }
    });
  }
}
