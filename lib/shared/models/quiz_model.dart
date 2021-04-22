import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { easy, medium, hard, expert}

extension LevelStringExt on String{
  Level get parse => {
    "easy" : Level.easy, 
    "medium": Level.medium, 
    "hard": Level.hard, 
    "expert": Level.expert
  }[this]!;
}

extension LevelExt on Level{
  String get parse => {
  Level.easy: "easy", 
  Level.medium: "medium", 
  Level.hard: "hard", 
  Level.expert: "expert"
  }[this]!; 
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final String imagem;
  final Level level;
  
  QuizModel({
    required this.title,
    required this.questions,
    this.questionAwnsered = 0,
    required this.imagem,
    required this.level
  });

  QuizModel copyWith({
    String? title,
    List<QuestionModel>? questions,
    int? questionAwnsered,
    String? imagem,
    Level? level,
  }) {
    return QuizModel(
      title: title ?? this.title,
      questions: questions ?? this.questions,
      questionAwnsered: questionAwnsered ?? this.questionAwnsered,
      imagem: imagem ?? this.imagem,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAwnsered': questionAwnsered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAwnsered: map['questionAwnsered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(title: $title, questions: $questions, questionAwnsered: $questionAwnsered, imagem: $imagem, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizModel &&
      other.title == title &&
      listEquals(other.questions, questions) &&
      other.questionAwnsered == questionAwnsered &&
      other.imagem == imagem &&
      other.level == level;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      questions.hashCode ^
      questionAwnsered.hashCode ^
      imagem.hashCode ^
      level.hashCode;
  }
}
