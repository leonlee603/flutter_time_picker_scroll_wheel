import 'package:flutter/material.dart';
import './hours.dart';
import './minutes.dart';
import './am_pm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentHour = 0;
  int _currentMin = 0;
  String _meridiem = 'am';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'PICKED TIME',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${_currentHour < 10 ? "0${_currentHour.toString()}" : _currentHour} : ${_currentMin < 10 ? "0${_currentMin.toString()}" : _currentMin} : $_meridiem',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 55,
                  width: 210,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            _currentHour = value;
                          });
                        },
                        itemExtent: 50,
                        perspective: 0.005,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 12,
                          builder: (context, index) {
                            return MyHours(hours: index);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            _currentMin = value;
                          });
                        },
                        itemExtent: 50,
                        perspective: 0.005,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            return MyMinutes(mins: index);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            if (value == 0) {
                              _meridiem = 'am';
                            } else {
                              _meridiem = 'pm';
                            }
                          });
                        },
                        itemExtent: 50,
                        perspective: 0.005,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 2,
                          builder: (context, index) {
                            if (index == 0) {
                              return const AmPm(isAm: true);
                            } else {
                              return const AmPm(isAm: false);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.5,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 70,
          //         child: ListWheelScrollView.useDelegate(
          //           onSelectedItemChanged: (value) {
          //             setState(() {
          //               _currentHour = value;
          //             });
          //           },
          //           itemExtent: 50,
          //           perspective: 0.005,
          //           diameterRatio: 1.2,
          //           physics: const FixedExtentScrollPhysics(),
          //           childDelegate: ListWheelChildBuilderDelegate(
          //             childCount: 12,
          //             builder: (context, index) {
          //               return MyHours(hours: index);
          //             },
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 70,
          //         child: ListWheelScrollView.useDelegate(
          //           onSelectedItemChanged: (value) {
          //             setState(() {
          //               _currentMin = value;
          //             });
          //           },
          //           itemExtent: 50,
          //           perspective: 0.005,
          //           diameterRatio: 1.2,
          //           physics: const FixedExtentScrollPhysics(),
          //           childDelegate: ListWheelChildBuilderDelegate(
          //             childCount: 60,
          //             builder: (context, index) {
          //               return MyMinutes(mins: index);
          //             },
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 70,
          //         child: ListWheelScrollView.useDelegate(
          //           onSelectedItemChanged: (value) {
          //             setState(() {
          //               if (value == 0) {
          //                 _meridiem = 'am';
          //               } else {
          //                 _meridiem = 'pm';
          //               }
          //             });
          //           },
          //           itemExtent: 50,
          //           perspective: 0.005,
          //           diameterRatio: 1.2,
          //           physics: const FixedExtentScrollPhysics(),
          //           childDelegate: ListWheelChildBuilderDelegate(
          //             childCount: 2,
          //             builder: (context, index) {
          //               if (index == 0) {
          //                 return const AmPm(isAm: true);
          //               } else {
          //                 return const AmPm(isAm: false);
          //               }
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
