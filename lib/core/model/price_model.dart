import 'dart:convert';

Map<String, Price> pricesFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, Price>(k, Price.fromJson(v)));

String pricesToJson(Map<String, Price> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Price {
  Price({
    required this.date,
    required this.hour,
    required this.hourShort,
    required this.isCheap,
    required this.isUnderAvg,
    required this.market,
    required this.price,
    required this.units,
  });

  String date; // TODO To datetime
  String? hour;
  String? hourShort;
  bool? isCheap;
  bool? isUnderAvg;
  String market;
  double price;
  String units;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        date: json["date"],
        hour: json["hour"] != null ? formatHour(json["hour"]) : '',
        hourShort: json["hour"] != null ? formatShortHour(json["hour"]) : '',
        isCheap: json["is-cheap"] ?? false,
        isUnderAvg: json["is-under-avg"] ?? false,
        market: json["market"],
        price: json["price"].toDouble(),
        units: json["units"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "hour": hour,
        "is-cheap": isCheap,
        "is-under-avg": isUnderAvg,
        "market": market,
        "price": price,
        "units": units,
      };

  static String formatHour(String hour) {
    return '${hour.substring(0, 2)}:00h - ${hour.substring(0, 2)}:59h';
  }

  static String formatShortHour(String hour) {
    return '${hour.substring(0, 2)}h - ${(int.parse(hour.substring(0, 2)) + 1)}h';
  }
}
