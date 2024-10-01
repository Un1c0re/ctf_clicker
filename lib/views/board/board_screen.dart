import 'package:ctf_clicker/utils/constants.dart';
import 'package:ctf_clicker/views/widgets/liderboard_widget.dart';
import 'package:flutter/cupertino.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Leaderboard!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        ScoreWidget(),
      ],
    );
  }
}
