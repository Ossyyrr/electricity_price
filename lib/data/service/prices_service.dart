import 'dart:async';
import 'dart:convert';

import 'package:electricity_price/core/model/price_model.dart';
import 'package:http/http.dart' as http;

class PricesService {
  final baseUrl = 'https://api.preciodelaluz.org/v1/prices/';

  Future<List<Price>> getPrices() async {
    final response = await http.get(Uri.parse('${baseUrl}all?zone=PCB'));
    Map<String, dynamic> responseDecode = jsonDecode(response.body);
    final List<Price> responsePrices = [];
    responseDecode.forEach((key, value) {
      responsePrices.add(Price.fromJson(jsonDecode(response.body)[key]));
    });
    print(responsePrices[3].hour);
    return responsePrices;
  }

  Future<Price> getAverage() async {
    final response = await http.get(Uri.parse('${baseUrl}avg?zone=PCB'));
    return Price.fromJson(jsonDecode(response.body));
  }

  Future<Price> getMaxPrice() async {
    final response = await http.get(Uri.parse('${baseUrl}max?zone=PCB'));
    return Price.fromJson(jsonDecode(response.body));
  }

  Future<Price> getMinPrice() async {
    final response = await http.get(Uri.parse('${baseUrl}min?zone=PCB'));
    return Price.fromJson(jsonDecode(response.body));
  }

  Future<Price> getCurrentPrice() async {
    final response = await http.get(Uri.parse('${baseUrl}now?zone=PCB'));
    return Price.fromJson(jsonDecode(response.body));
  }
}
