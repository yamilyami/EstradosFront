//import 'package:your_app/feature/cards/domain/entities/card_entity.dart';
//import 'package:your_app/feature/cards/domain/repositories/cards_repository.dart';
//import '../datasources/cards_remote_data_source.dart';

import 'package:exdesc_2025/feature/data/datesources/cards_datasource.dart';
import 'package:exdesc_2025/feature/domain/entities/card_entity.dart';
import 'package:exdesc_2025/feature/domain/repositories/cards_repository.dart';

class CardsRepositoryImpl implements CardsRepository {
  final CardsRemoteDataSource remoteDataSource;

  CardsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CardEntity>> getAllCards() async {
    final models = await remoteDataSource.getAllCards();
    return models.map((model) => model.toEntity()).toList();
  }
}
