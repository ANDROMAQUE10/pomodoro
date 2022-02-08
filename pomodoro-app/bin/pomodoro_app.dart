import 'dart:async';
import 'package:intl/intl.dart';

// import 'model/time_to_work.dart';

main() {
  start();
}

void start() {
  Timer.periodic(
    Duration(seconds: 1),
    (timer) {
      final timeLeft = timeRemaining([3, 0, 0], 0, 0);
      print(timeLeft);
    },
  );
}

String remainingTimeToText(Duration duration) {
  // int days = duration.inDays;
  int hours = duration.inHours;
  int minutes = duration.inMinutes - hours * 60;
  int seconds = duration.inSeconds - hours * 3600 - minutes * 60;
  if (hours > 0) {
    String s = " hours ";
    if (hours == 1) {
      s = " hour ";
    }
    return hours.toString() +
        s +
        customString(minutes) +
        ":" +
        customString(seconds);
  } else {
    return customString(hours) +
        ":" +
        customString(minutes) +
        ":" +
        customString(seconds);
  }
}

String customString(int i) {
  if (i < 10) {
    return "0" + i.toString();
  } else {
    return i.toString();
  }
}

bool listContainsValue(List<int> list, int value) {
  for (var element in list) {
    if (element == value) {
      // print(true);
      return true;
    }
  }
  // print(false);
  return false;
}

timeRemaining(List<int> weekdays, int startingHour, int endingHour) {
  DateTime now = DateTime.now();
  bool timeIsSpecial = false;
  for (var specificWeekday in weekdays) {
    if (now.weekday == specificWeekday &&
        (now.hour >= startingHour && now.hour < endingHour)) {
      timeIsSpecial = true;
    }
  }
  print(timeIsSpecial);
  if (!timeIsSpecial) {
    DateTime nextSpecialTime =
        DateTime(now.year, now.month, now.day, startingHour);
    while (nextSpecialTime.isBefore(now) ||
        !listContainsValue(weekdays, nextSpecialTime.weekday)) {
      nextSpecialTime = nextSpecialTime.add(Duration(days: 1));
    }
    return remainingTimeToText(nextSpecialTime.difference(now));
  } else {
    return "";
  }
}
