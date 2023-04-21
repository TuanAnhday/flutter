
import '../utils/api.dart';
import '../utils/custom_toast.dart';
import '../utils/logger.dart';
import '../utils/shared_preferences.dart';

class Application {
  Application._();

  static late SpUtil sharePreference;
  static late API api;
  static late Toastify toast;
  static late AppLogger logger;
}
