import 'dart:convert';
import 'package:exdesc_2025/feature/data/model/dollar_model.dart';
import 'package:http/http.dart' as http;

class DollarApiService {
  Future<DollarRate> fetchOfficialDollar() async {
    final url = Uri.parse('https://api.exchangerate-api.com/v4/latest/USD');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return DollarRate.fromJson(data);
    } else {
      throw Exception('Error al cargar el dólar');
    }
  }
}
