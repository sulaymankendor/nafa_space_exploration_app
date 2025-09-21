import 'package:intl/intl.dart';

String formatLaunchTime(String isoDateString) {
  // Parse the ISO 8601 string into a DateTime object
  final dateTime = DateTime.parse(isoDateString);

  // Format the DateTime object with only the time pattern
  // 'hh' for hour (12-hour format), 'mm' for minute, 'a' for am/pm
  final timeFormatter = DateFormat('hh:mm a');

  return timeFormatter.format(dateTime);
}
