import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key : key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 24
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: "Easy"),
                LevelButtonWidget(label: "Medium"),
                LevelButtonWidget(label: "Hard"),
                LevelButtonWidget(label: "Expert")
              ],
            ),
            SizedBox(
              height: 24
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            )            
          ],
        ),
      )
    );
  }
}