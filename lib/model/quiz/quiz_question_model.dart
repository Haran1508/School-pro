// To parse this JSON data, do
//
//     final quizQuestionModel = quizQuestionModelFromJson(jsonString);

import 'dart:convert';

QuizQuestionModel quizQuestionModelFromJson(String str) => QuizQuestionModel.fromJson(json.decode(str));

String quizQuestionModelToJson(QuizQuestionModel data) => json.encode(data.toJson());

class QuizQuestionModel {
  QuizQuestionModel({
    this.isSuccess,
    this.message,
    this.quizzes,
  });

  bool isSuccess;
  List<String> message;
  Quizzes quizzes;

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) => QuizQuestionModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    quizzes: Quizzes.fromJson(json["quizzes"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "quizzes": quizzes.toJson(),
  };
}

class Quizzes {
  Quizzes({
    this.id,
    this.name,
    this.uniqueId,
    this.slug,
    this.isActive,
    this.isPaid,
    this.image,
    this.courseId,
    this.subjectId,
    this.quizDateAndTime,
    this.duration,
    this.description,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.course,
    this.subject,
    this.questions,
  });

  int id;
  String name;
  String uniqueId;
  String slug;
  int isActive;
  int isPaid;
  dynamic image;
  int courseId;
  int subjectId;
  DateTime quizDateAndTime;
  String duration;
  String description;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Course course;
  Course subject;
  List<QuestionElement> questions;

  factory Quizzes.fromJson(Map<String, dynamic> json) => Quizzes(
    id: json["id"],
    name: json["name"],
    uniqueId: json["unique_id"],
    slug: json["slug"],
    isActive: json["is_active"],
    isPaid: json["is_paid"],
    image: json["image"],
    courseId: json["course_id"],
    subjectId: json["subject_id"],
    quizDateAndTime: DateTime.parse(json["quiz_date_and_time"]),
    duration: json["duration"],
    description: json["description"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    course: Course.fromJson(json["course"]),
    subject: Course.fromJson(json["subject"]),
    questions: List<QuestionElement>.from(json["questions"].map((x) => QuestionElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "unique_id": uniqueId,
    "slug": slug,
    "is_active": isActive,
    "is_paid": isPaid,
    "image": image,
    "course_id": courseId,
    "subject_id": subjectId,
    "quiz_date_and_time": quizDateAndTime.toIso8601String(),
    "duration": duration,
    "description": description,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "course": course.toJson(),
    "subject": subject.toJson(),
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.name,
    this.uniqueId,
    this.slug,
    this.isActive,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.courseId,
  });

  int id;
  String name;
  String uniqueId;
  String slug;
  int isActive;
  dynamic image;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int courseId;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    uniqueId: json["unique_id"],
    slug: json["slug"],
    isActive: json["is_active"],
    image: json["image"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    courseId: json["course_id"] == null ? null : json["course_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "unique_id": uniqueId,
    "slug": slug,
    "is_active": isActive,
    "image": image,
    "deleted_at": deletedAt,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "course_id": courseId == null ? null : courseId,
  };
}

class QuestionElement {
  QuestionElement({
    this.id,
    this.quizId,
    this.questionId,
    this.createdAt,
    this.updatedAt,
    this.question,
  });

  int id;
  int quizId;
  int questionId;
  DateTime createdAt;
  DateTime updatedAt;
  QuestionQuestion question;

  factory QuestionElement.fromJson(Map<String, dynamic> json) => QuestionElement(
    id: json["id"],
    quizId: json["quiz_id"],
    questionId: json["question_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    question: QuestionQuestion.fromJson(json["question"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quiz_id": quizId,
    "question_id": questionId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "question": question.toJson(),
  };
}

class QuestionQuestion {
  QuestionQuestion({
    this.id,
    this.questionCategoryId,
    this.questionShortDescription,
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.option6,
    this.correctAnswer,
    this.mark,
    this.negativeMark,
    this.explanation,
    this.hint,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int questionCategoryId;
  String questionShortDescription;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  dynamic option5;
  dynamic option6;
  int correctAnswer;
  String mark;
  String negativeMark;
  dynamic explanation;
  dynamic hint;
  int isActive;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory QuestionQuestion.fromJson(Map<String, dynamic> json) => QuestionQuestion(
    id: json["id"],
    questionCategoryId: json["question_category_id"],
    questionShortDescription: json["question_short_description"],
    question: json["question"],
    option1: json["option_1"],
    option2: json["option_2"],
    option3: json["option_3"],
    option4: json["option_4"],
    option5: json["option_5"],
    option6: json["option_6"],
    correctAnswer: json["correct_answer"],
    mark: json["mark"],
    negativeMark: json["negative_mark"],
    explanation: json["explanation"],
    hint: json["hint"],
    isActive: json["is_active"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question_category_id": questionCategoryId,
    "question_short_description": questionShortDescription,
    "question": question,
    "option_1": option1,
    "option_2": option2,
    "option_3": option3,
    "option_4": option4,
    "option_5": option5,
    "option_6": option6,
    "correct_answer": correctAnswer,
    "mark": mark,
    "negative_mark": negativeMark,
    "explanation": explanation,
    "hint": hint,
    "is_active": isActive,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
