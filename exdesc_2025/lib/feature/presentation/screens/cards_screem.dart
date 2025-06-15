/*import 'package:exdesc_2025/feature/presentation/blocs/card_bloc.dart';
import 'package:exdesc_2025/feature/presentation/blocs/card_state.dart';
import 'package:exdesc_2025/feature/presentation/blocs/cards_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardsBloc>(
      create: (_) => GetIt.instance<CardsBloc>()..add(LoadCardsEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cartas disponibles')),
        body: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            if (state is CardsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CardsLoadedState) {
              final cards = state.cards;
              if (cards.isEmpty) {
                return const Center(child: Text('No hay cartas disponibles'));
              }
              return ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return ListTile(
                    leading: Image.network(
                      card.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      'Ataque: ${card.attack} | Defensa: ${card.defense}',
                    ),
                    subtitle: Text('Series: ${card.series.join(', ')}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Acá podés manejar la compra
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Compraste una carta (falta implementar lógica)',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is CardsErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Estado inesperado'));
            }
          },
        ),
      ),
    );
  }
}
*/
import 'package:exdesc_2025/feature/presentation/blocs/card_bloc.dart';
import 'package:exdesc_2025/feature/presentation/blocs/card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cartas Disponibles')),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          if (state is CardsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CardsLoadedState) {
            final cards = state.cards;
            return ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return ListTile(
                  leading: Image.network(card.imageUrl, width: 50, height: 50),
                  title: Text(
                    'Ataque: ${card.attack} - Defensa: ${card.defense}',
                  ),
                  subtitle: Text('Series: ${card.series.join(', ')}'),
                );
              },
            );
          } else if (state is CardsErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Esperando acción...'));
        },
      ),
    );
  }
}
