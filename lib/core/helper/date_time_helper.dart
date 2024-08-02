import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTimeFromString(
      {required String dateTimeString, required String format}) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat(format, 'id').format(dateTime);
  }

  static String formatDateTime(
      {required DateTime dateTime, required String format}) {
    return DateFormat(format, 'id').format(dateTime);
  }

  static Duration getDifference(
      {required DateTime dateTime1, required DateTime dateTime2}) {
    return dateTime2.difference(dateTime1);
  }
}
