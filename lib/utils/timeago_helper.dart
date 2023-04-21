import 'package:timeago/timeago.dart' as timeago;

class TimeAgoWrapper {
  TimeAgoWrapper.init() {
    timeago.setLocaleMessages("vi", timeago.ViMessages());
  }

  static String formatTimeAgo(DateTime date) => timeago.format(date, locale: "vi", clock: DateTime.now());
}
