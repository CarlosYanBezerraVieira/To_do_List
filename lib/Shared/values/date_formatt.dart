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

  String getWeekDay(int weekday) {
    switch (weekday) {
      case DateTime.sunday:
        return 'Domingo';
      case DateTime.monday:
        return 'Segunda';
      case DateTime.tuesday:
        return 'Terça-feira';
      case DateTime.wednesday:
        return 'Quarta-feira';
      case DateTime.thursday:
        return 'Quinta-feira';
      case DateTime.friday:
        return 'Sexta-feira';
      case DateTime.saturday:
        return 'Sábado';
      default:
        return 'Dia inválido';
    }
  }

  String convertMonthFromSeconds(int seconds) {
    var clock = DateTime.fromMillisecondsSinceEpoch(seconds);
    String date =
        DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, "pt_Br").format(clock);
    return date;
  }

  String convertHourFromSeconds(int seconds) {
    final clock = DateTime.fromMillisecondsSinceEpoch(seconds);
    String date = DateFormat(DateFormat.HOUR24_MINUTE, "pt_Br").format(clock);
    return date;
  }
}
