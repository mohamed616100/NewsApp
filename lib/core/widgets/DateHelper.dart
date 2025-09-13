import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'No Date';
    }
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat("MMM dd, yyyy").format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }
}
