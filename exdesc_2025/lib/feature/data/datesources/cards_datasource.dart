import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exdesc_2025/feature/data/model/cardmodel.dart';
//import '../models/card_model.dart';

abstract class CardsRemoteDataSource {
  Future<List<CardModel>> getAllCards();
}

class CardsRemoteDataSourceImpl implements CardsRemoteDataSource {
  final FirebaseFirestore firestore;

  CardsRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CardModel>> getAllCards() async {
    final querySnapshot = await firestore.collection('cards').get();
    return querySnapshot.docs.map((doc) {
      return CardModel.fromJson(doc.data(), doc.id);
    }).toList();
  }
}
