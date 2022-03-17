import 'package:intl/intl.dart';

class DateFormatt {
  String getActualDay() {
    return DateFormat('dd', 'pt_BR').format(DateTime.now());
  }

  String getActualMonth() {
    return DateFormat('MMMM', 'pt_BR').format(DateTime.now());
  }

  String getActualYear() {
    return DateFormat('yyyy', 'pt_BR').format(DateTime.now());
  }

  String getHour() {
    return DateFormat('HH:mm', 'pt_BR').format(DateTime.now());
  }
}
