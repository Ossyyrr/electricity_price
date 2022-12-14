import 'dart:async';

import 'package:electricity_price/core/model/price_model.dart';
import 'package:electricity_price/data/service/prices_service.dart';

class PricesRepository {
  static final PricesRepository _instance = PricesRepository._internal();
  PricesRepository._internal() {
    // initialization logic
    init();
  }

  factory PricesRepository() {
    return _instance;
  }

  final baseUrl = 'https://api.preciodelaluz.org/v1/prices/';

  List<Price> _todayPrices = [];
  List<Price> get todayPrices => _todayPrices;

  late Price _average;
  Price get average => _average;

  late Price _maxPrice;
  Price get maxPrice => _maxPrice;

  late Price _minPrice;
  Price get minPrice => _minPrice;

  late Price _currentPrice;
  Price get currentPrice => _currentPrice;

  final StreamController<List<Price>> _pricesController = StreamController<List<Price>>.broadcast();
  Stream<List<Price>> get pricesStream => _pricesController.stream;

  final StreamController<Price> _averageController = StreamController<Price>.broadcast();
  Stream<Price> get averageStream => _averageController.stream;

  final StreamController<Price> _maxPriceController = StreamController<Price>.broadcast();
  Stream<Price> get maxPriceStream => _maxPriceController.stream;

  final StreamController<Price> _minPriceController = StreamController<Price>.broadcast();
  Stream<Price> get minPriceStream => _minPriceController.stream;

  final StreamController<Price> _currentPriceController = StreamController<Price>.broadcast();
  Stream<Price> get currentPriceStream => _currentPriceController.stream;

  void updateTodayPrices(List<Price> newPrices) {
    _todayPrices = newPrices;
    _pricesController.sink.add(newPrices);
  }

  void updateAverage(Price newAverage) {
    _average = newAverage;
    _averageController.sink.add(newAverage);
  }

  void updateMaxPrice(Price newMaxPrice) {
    _maxPrice = newMaxPrice;
    _maxPriceController.sink.add(newMaxPrice);
  }

  void updateMinPrice(Price newMinPrice) {
    _minPrice = newMinPrice;
    _minPriceController.sink.add(newMinPrice);
  }

  void updateCurrentPrice(Price newCurrentPrice) {
    _currentPrice = newCurrentPrice;
    _currentPriceController.sink.add(newCurrentPrice);
  }

  Future<void> init() async {
    await getAverage();
    await getMaxPrice();
    await getMinPrice();
    await getCurrentPrice();
    await getPrices(); // This is the last one because need previous data to show layout
  }

  Future<void> getPrices() async {
    updateTodayPrices(await PricesService().getPrices());
  }

  Future<void> getAverage() async {
    updateAverage(await PricesService().getAverage());
  }

  Future<void> getMaxPrice() async {
    updateMaxPrice(await PricesService().getMaxPrice());
  }

  Future<void> getMinPrice() async {
    updateMinPrice(await PricesService().getMinPrice());
  }

  Future<void> getCurrentPrice() async {
    updateCurrentPrice(await PricesService().getCurrentPrice());
  }
}
