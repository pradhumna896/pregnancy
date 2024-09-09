import 'package:easy_localization/easy_localization.dart';

class TimeFormateMethod {
  getTimeFormate({time, formate = 'yyyy-MM-dd'}) {
    // Extracting time from the DateTime object
    DateTime inputDatetime = DateTime.parse(time).toLocal();
    String formattedDatetime = DateFormat(formate).format(inputDatetime);
    return formattedDatetime;
  }
}
