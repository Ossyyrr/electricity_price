extension DateTimeExtension on DateTime {
  ///returns day, month and year as dateTime
  DateTime date() {
    return DateTime(year, month, day);
  }

  ///compare two dates
  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  ///returns a string with the date without the hours (day/month/year)
  String toStringDate() {
    String newDay;
    String newMonth;

    if (day < 10) {
      newDay = '0$day';
    } else {
      newDay = '$day';
    }

    if (month < 10) {
      newMonth = '0$month';
    } else {
      newMonth = '$month';
    }

    return '$newDay/$newMonth/$year'.toString();
  }
}
