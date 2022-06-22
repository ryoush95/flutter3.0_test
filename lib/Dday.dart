import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dday extends StatefulWidget {
  const Dday({Key? key}) : super(key: key);

  @override
  State<Dday> createState() => _DdayState();
}

class _DdayState extends State<Dday> {
  DateTime? start;
  DateTime? end;
  DateTime now = DateTime.now();
  Duration? dday;

  @override
  void initState() {
    start = DateTime.now();
    end = DateTime.now().add(Duration(days: 7));
    dday = end!.difference(start!);

    super.initState();
  }

  void _showDatePicker(String s) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2099))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        s == 's'?start = pickedDate:end = pickedDate;
        end = end!.add(Duration(days: 1));
        dday = end!.difference(now);
      });
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D-day'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(dday!.inDays.toString() == '0'?'D-day':'D-${dday!.inDays.toString()}',
            style: TextStyle(
              fontSize: 20
            )),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    _showDatePicker('s');
                  },
                  child: const Text('시작일')),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    _showDatePicker('e');
                  },
                  child: const Text('종료일')),
            ),
          ]),
        ],
      ),
    );
  }
}
