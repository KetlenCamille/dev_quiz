import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget ({Key ? key, required this.answer, this.isSelected = false, required this.onTap, this.disabled = false}) : super(key : key);
  
  Color get _selectedColorRight => answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight => answer.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight => answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.error;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: (){
            onTap(answer.isRight);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                color: isSelected ? _selectedBorderCardRight : AppColors.border))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight : AppColors.darkGreen,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(color: isSelected ? _selectedBorderRight : AppColors.border))
                  ),
                  child: isSelected ? Icon(
                    _selectedIconRight,
                    color: AppColors.white,
                    size: 16,
                    )
                  : null
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}