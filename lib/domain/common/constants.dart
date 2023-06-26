import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Constants {
  Constants._();

  static final Constants instance = Constants._();

  factory Constants() {
    return instance;
  }

  static const baseUrl = 'http://tt25.uz:9082/ws/'; // Test url

  static const pysics = BouncingScrollPhysics();

  static String formatDate(DateTime date) =>
      DateFormat('yyyy-MM-dd', 'en').format(date);

  static String formatTime(DateTime date) => DateFormat('H:mm').format(date);

  static String formatMinuteToTime(int min) {
    final d = Duration(minutes: min);
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    if (seconds > 0) {
      tokens.add('${seconds}s');
    }

    return tokens.join(' ');
  }
}

/// This duration in milliseconds
const int kBounceAnimDuration = 150;

/// This interval in milliseconds
const int kLiveListAnimInterval = 70;

/// This duration in milliseconds
const int kDefaultAnimationDuration = 350;

/// Default resend time interval
const defaultResendTimeInterval = 120;

/// available payment methods
const kPaymentCardList = <Map<String, String>>[
  {'icon': 'assets/images/Uzcard.png', 'name': 'Uzcard & Humo'},
  {'icon': 'assets/images/click.png', 'name': 'Click evolution'},
  {
    'icon': 'assets/images/master_card.png',
    'name': 'International payment system'
  },
  {'icon': 'assets/images/booking.png', 'name': 'Booking ticket'},
];

const int multiCityCount = 5;
