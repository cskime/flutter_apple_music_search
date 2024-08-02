import 'package:intl/intl.dart';

class ReleaseDateFormatter {
  final _dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ");

  DateTime dateTime(String dateString) => _dateFormat.parse(dateString);
}
