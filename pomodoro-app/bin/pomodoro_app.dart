import 'dart:async';

main() {
  timeToWork();
}

Timer interval(Duration duration, func) {
  Timer function() {
    Timer timer = Timer(duration, function);
    func(timer);
    return timer;
  }

  return Timer(duration, function);
}

//* 1 minutes = 60 seconds *//
// void converter() {
//   final forMin = 60;
//   final forHourse = 360;
// }

void timeToWork() {
  const timeForWork = 1;
  const converterForMin = timeForWork * 10;
  int i = 0;
  print('You have $timeForWork minutes for Work! Good Luke!');
  interval(Duration(seconds: 1), (timer) {
    print(i++);
    if (i > converterForMin) {
      print('Time to take a break!');
      timer.cancel();
      timeToBreak();
    }
  });
}

void timeToBreak() {
  const timeForBreak = 1;
  const converterForMin = timeForBreak * 10;
  int i = 0;
  print('You have $timeForBreak minutes for break');
  interval(Duration(seconds: 1), (timer) {
    print(i++);
    if (i > converterForMin) {
      print("It's time to work!");
      timer.cancel();
    }
  });
}
