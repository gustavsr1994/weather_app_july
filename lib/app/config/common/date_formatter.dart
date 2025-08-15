import 'package:intl/intl.dart';

String fullFormatDate(DateTime value) {
  return DateFormat('EEEE, dd MMMM yyyy').format(value);
}
