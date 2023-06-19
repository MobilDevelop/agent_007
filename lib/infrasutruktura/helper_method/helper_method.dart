import 'package:easy_localization/easy_localization.dart';

class Helper {
  static String formatDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}
