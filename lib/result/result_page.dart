import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget{
  final String title;
  final int length;
  final int result;

  const ResultPage({Key? key, required this.title, required this.length, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top:100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Congratulations!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(TextSpan(
                  text:"You concluded ",
                  style: AppTextStyles.body,
                  children:[
                    TextSpan(
                      text: "\n$title",
                      style: AppTextStyles.bodyBold,
                    ),
                    TextSpan(
                      text: "\ncom $required de $length acertos",
                      style: AppTextStyles.body,
                    )
                  ]
                ), 
                textAlign: TextAlign.center,),
              ],
            ),
            Column(
              children: [
                  Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Share",
                          onTap: (){
                            Share.share('DevQuiz NLW5 - Flutter: Resultado do Quiz $title\nObtive: ${result/length}% de aproveitamento!');
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: "Back to start",
                          onTap: (){
                            Navigator.pop(context);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}