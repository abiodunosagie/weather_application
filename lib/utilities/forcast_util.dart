import 'package:intl/intl.dart';

class Util {
  static String appId = '57da4770d9a469363b7ea371e6603933';

  //creat a helper method that will allow us convert the date

  static String getFormattedDate(DateTime dateTime) {
    return DateFormat("EEEE, MMM d, y").format(dateTime);
  }

  static String? getFormattedTime(n) {
    String date = DateFormat.jm().format(n);
    return date;
  }
}
