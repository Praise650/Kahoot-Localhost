import 'package:intl/intl.dart';

class DateFormatters {
  static String formatDate(DateTime? timeStamp) {
    String date;
    if (timeStamp == null) {
      date = '-- -- --';
      return date;
    } else {
      date = DateFormat('yyyy-MM-dd').format(
        timeStamp,
      );
      return date;
    }
  }

  static String formatTime(DateTime? timeStamp) {
    String time;
    if (timeStamp == null) {
      time = '-- --';
      return time;
    } else {
      time = DateFormat('kk:mm:a').format(timeStamp);
      return time;
    }
  }

  static String stringToString(String? timeStamp){
    final dateFormatter = DateTime.parse(timeStamp??'');
    final time = DateFormat("H:m a").format(dateFormatter);
    return time;
  }
}
