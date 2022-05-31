// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

ClassModel classModelFromJson(String str) => ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  ClassModel({
    this.isSuccess,
    this.message,
    this.classes,
  });

  bool isSuccess;
  List<String> message;
  Classes classes;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    classes: Classes.fromJson(json["classes"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "classes": classes.toJson(),
  };
}

class Classes {
  Classes({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
  };
}

class Datum {
  Datum({
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
  Teacher teacher;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    teacher: Teacher.fromJson(json["teacher"]),
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
    name:json["name"],
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
    "slug": slug,
    "is_active": isActive,
    "image": image,
    "deleted_at": deletedAt,
    "course_id": courseId == null ? null : courseId,
    "subject_id": subjectId == null ? null : subjectId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class Teacher {
  Teacher({
    this.id,
    this.name,
    this.email,
    this.isSubscribed,
  });

  int id;
  String name;
  String email;
  bool isSubscribed;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
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
