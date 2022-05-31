// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) => DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
  DashBoardModel({
    this.isSuccess,
    this.message,
    this.stories,
    this.freeClasses,
    this.teachers,
    this.upcomingClasses,
    this.liveClasses,
    this.recentlyCompletedClasses,
    this.questionBank,
    this.onlineTest,
    this.usr,
  });

  bool isSuccess;
  List<String> message;
  List<DashBoardModelStory> stories;
  List<Class> freeClasses;
  List<TeacherElement> teachers;
  List<Class> upcomingClasses;
  List<Class> liveClasses;
  List<Class> recentlyCompletedClasses;
  List<QuestionBank> questionBank;
  List<OnlineTest> onlineTest;
  Usr usr;

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    stories: List<DashBoardModelStory>.from(json["stories"].map((x) => DashBoardModelStory.fromJson(x))),
    freeClasses: List<Class>.from(json["free_classes"].map((x) => Class.fromJson(x))),
    teachers: List<TeacherElement>.from(json["teachers"].map((x) => TeacherElement.fromJson(x))),
    upcomingClasses: List<Class>.from(json["upcoming_classes"].map((x) => Class.fromJson(x))),
    liveClasses: List<Class>.from(json["live_classes"].map((x) => Class.fromJson(x))),
    recentlyCompletedClasses: List<Class>.from(json["recently_completed_classes"].map((x) => Class.fromJson(x))),
    questionBank: List<QuestionBank>.from(json["question_bank"].map((x) => QuestionBank.fromJson(x))),
    onlineTest: List<OnlineTest>.from(json["online_test"].map((x) => OnlineTest.fromJson(x))),
    usr: Usr.fromJson(json["usr"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
    "free_classes": List<dynamic>.from(freeClasses.map((x) => x.toJson())),
    "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
    "upcoming_classes": List<dynamic>.from(upcomingClasses.map((x) => x.toJson())),
    "live_classes": List<dynamic>.from(liveClasses.map((x) => x.toJson())),
    "recently_completed_classes": List<dynamic>.from(recentlyCompletedClasses.map((x) => x.toJson())),
    "question_bank": List<dynamic>.from(questionBank.map((x) => x.toJson())),
    "online_test": List<dynamic>.from(onlineTest.map((x) => x.toJson())),
    "usr": usr.toJson(),
  };
}

class Class {
  Class({
    this.id,
    this.name,
    this.uniqueId,
    this.courseId,
    this.subjectId,
    this.chapterId,
    this.teacherId,
    this.slug,
    this.isActive,
    this.isPaid,
    this.image,
    this.classDateAndTime,
    this.duration,
    this.description,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.classstatus,
    this.course,
    this.subject,
    this.chapter,
    this.teacher,
  });

  int id;
  String name;
  String uniqueId;
  int courseId;
  int subjectId;
  int chapterId;
  int teacherId;
  String slug;
  int isActive;
  int isPaid;
  dynamic image;
  DateTime classDateAndTime;
  String duration;
  String description;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int classstatus;
  Chapter course;
  Chapter subject;
  Chapter chapter;
  FreeClassTeacher teacher;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: json["id"],
    name: json["name"],
    uniqueId: json["unique_id"],
    courseId: json["course_id"],
    subjectId: json["subject_id"],
    chapterId: json["chapter_id"],
    teacherId: json["teacher_id"],
    slug: json["slug"],
    isActive: json["is_active"],
    isPaid: json["is_paid"],
    image: json["image"],
    classDateAndTime: DateTime.parse(json["class_date_and_time"]),
    duration: json["duration"],
    description: json["description"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    classstatus: json["classstatus"],
    course: Chapter.fromJson(json["course"]),
    subject: Chapter.fromJson(json["subject"]),
    chapter: Chapter.fromJson(json["chapter"]),
    teacher: FreeClassTeacher.fromJson(json["teacher"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "unique_id": uniqueId,
    "course_id": courseId,
    "subject_id": subjectId,
    "chapter_id": chapterId,
    "teacher_id": teacherId,
    "slug": slug,
    "is_active": isActive,
    "is_paid": isPaid,
    "image": image,
    "class_date_and_time": classDateAndTime.toIso8601String(),
    "duration": duration,
    "description": description,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "classstatus": classstatus,
    "course": course.toJson(),
    "subject": subject.toJson(),
    "chapter": chapter.toJson(),
    "teacher": teacher.toJson(),
  };
}

class Chapter {
  Chapter({
    this.id,
    this.name,
    this.uniqueId,
    this.slug,
    this.isActive,
    this.image,
    this.deletedAt,
    this.courseId,
    this.subjectId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String uniqueId;
  String slug;
  int isActive;
  dynamic image;
  dynamic deletedAt;
  int courseId;
  int subjectId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"],
    name: json["name"],
    uniqueId: json["unique_id"],
    slug: json["slug"],
    isActive: json["is_active"],
    image: json["image"],
    deletedAt: json["deleted_at"],
    courseId: json["course_id"] == null ? null : json["course_id"],
    subjectId: json["subject_id"] == null ? null : json["subject_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "unique_id": uniqueId,
    "slug":slug,
    "is_active": isActive,
    "image": image,
    "deleted_at": deletedAt,
    "course_id": courseId == null ? null : courseId,
    "subject_id": subjectId == null ? null : subjectId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class FreeClassTeacher {
  FreeClassTeacher({
    this.id,
    this.name,
    this.isSubscribed,
  });

  int id;
  String name;
  bool isSubscribed;

  factory FreeClassTeacher.fromJson(Map<String, dynamic> json) => FreeClassTeacher(
    id: json["id"],
    name: json["name"],
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_subscribed": isSubscribed,
  };
}


class OnlineTest {
  OnlineTest({
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
  });

  int id;
  String name;
  String uniqueId;
  String slug;
  int isActive;
  int isPaid;
  String image;
  int courseId;
  int subjectId;
  DateTime quizDateAndTime;
  String duration;
  String description;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory OnlineTest.fromJson(Map<String, dynamic> json) => OnlineTest(
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
  };
}

class QuestionBank {
  QuestionBank({
    this.id,
    this.name,
    this.parentId,
    this.image,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.shortDescription,
    this.createdBy,
    this.position,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.chapterscount,
  });

  int id;
  String name;
  String parentId;
  dynamic image;
  String slug;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  int status;
  dynamic shortDescription;
  dynamic createdBy;
  dynamic position;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int chapterscount;

  factory QuestionBank.fromJson(Map<String, dynamic> json) => QuestionBank(
    id: json["id"],
    name: json["name"],
    parentId: json["parent_id"],
    image: json["image"],
    slug: json["slug"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    status: json["status"],
    shortDescription: json["short_description"],
    createdBy: json["created_by"],
    position: json["position"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    chapterscount: json["chapterscount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parent_id": parentId,
    "image": image,
    "slug": slug,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "status": status,
    "short_description": shortDescription,
    "created_by": createdBy,
    "position": position,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "chapterscount": chapterscount,
  };
}

class DashBoardModelStory {
  DashBoardModelStory({
    this.id,
    this.name,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.stories,
  });

  int id;
  String name;
  String image;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<StoryStory> stories;

  factory DashBoardModelStory.fromJson(Map<String, dynamic> json) => DashBoardModelStory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    stories: List<StoryStory>.from(json["stories"].map((x) => StoryStory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
  };
}

class StoryStory {
  StoryStory({
    this.id,
    this.storyCategoryId,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int storyCategoryId;
  String image;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory StoryStory.fromJson(Map<String, dynamic> json) => StoryStory(
    id: json["id"],
    storyCategoryId: json["story_category_id"],
    image: json["image"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "story_category_id": storyCategoryId,
    "image": image,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class TeacherElement {
  TeacherElement({
    this.id,
    this.type,
    this.name,
    this.email,
    this.image,
    this.isSubscribed,
  });

  int id;
  int type;
  String name;
  String email;
  dynamic image;
  bool isSubscribed;

  factory TeacherElement.fromJson(Map<String, dynamic> json) => TeacherElement(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "email": email,
    "image": image,
    "is_subscribed": isSubscribed,
  };
}

class Usr {
  Usr({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.isSubscribed,
  });

  int id;
  String name;
  String email;
  String mobile;
  dynamic address;
  bool isSubscribed;

  factory Usr.fromJson(Map<String, dynamic> json) => Usr(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "is_subscribed": isSubscribed,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
