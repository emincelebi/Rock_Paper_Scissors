import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog(
      {super.key, required this.win, required this.lose, required this.draw});
  final int win;
  final int lose;
  final int draw;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Column(
          children: [
            Text('Win: $win'),
            Text('Lose: $lose'),
            Text('Draw: $draw'),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
