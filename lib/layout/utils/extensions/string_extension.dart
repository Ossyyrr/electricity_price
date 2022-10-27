//import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  ///transform a string into a DateTime "dd, MM, yyyy"
  // DateTime toDateTime() {
  //   DateFormat format = DateFormat("dd, MM, yyyy");
  //   return format.parse(this);
  // }

  /// Returns the number of indicated words of a string starting with the first.
  String firstWords(int numberOfWords) {
    return split(' ').sublist(0, numberOfWords).join(" ");
  }
}
