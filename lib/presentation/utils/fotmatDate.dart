import 'package:intl/intl.dart';

String formatLaunchDate(String isoDateString) {
  // Parse the ISO 8601 string into a DateTime object
  final dateTime = DateTime.parse(isoDateString);

  // Format the DateTime object into the desired format
  // 'd' for day without leading zero, 'MMMM' for full month name, 'y' for year
  // 'h' for hour (12-hour format), 'mm' for minute, 'a' for am/pm
  final formatter = DateFormat('d MMMM yyyy hh:mm a');

  return formatter.format(dateTime);
}
