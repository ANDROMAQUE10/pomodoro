// import '../pomodoro_app.dart';
// import 'time_to_break.dart';

// void timeToWork() {
//   const timeForWork = 1;
//   const converterForMin = timeForWork * 10;
//   int i = 0;
//   print('You have $timeForWork minutes for Work! Good Luke!');
//   interval(Duration(seconds: 1), (timer) {
//     print(i++);
//     if (i > converterForMin) {
//       print('Time to take a break!');
//       timer.cancel();
//       timeToBreak();
//     }
//   });
// }