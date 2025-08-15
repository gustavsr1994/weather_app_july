import 'package:intl/intl.dart';

String fullFormatDate(DateTime value) {
  return DateFormat('EEEE, dd MMMM yyyy').format(value);
}

String dayFormatDate(String value) {
  var date = DateFormat('yyyy-MM-dd hh:mm:ss').parse(value);
  return DateFormat('dd').format(date);
}

String timeFormatTime(String value) {
  var date = DateFormat('yyyy-MM-dd hh:mm:ss').parse(value);
  return DateFormat('HH:mm').format(date);
}
