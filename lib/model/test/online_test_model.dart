// To parse this JSON data, do
//
//     final onlineTestModel = onlineTestModelFromJson(jsonString);

import 'dart:convert';

OnlineTestModel onlineTestModelFromJson(String str) => OnlineTestModel.fromJson(json.decode(str));

String onlineTestModelToJson(OnlineTestModel data) => json.encode(data.toJson());

class OnlineTestModel {
  OnlineTestModel({
    this.isSuccess,
    this.message,
    this.onlineTests,
  });

  bool isSuccess;
  List<String> message;
  OnlineTests onlineTests;

  factory OnlineTestModel.fromJson(Map<String, dynamic> json) => OnlineTestModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    onlineTests: OnlineTests.fromJson(json["online_tests"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "online_tests": onlineTests.toJson(),
  };
}

class OnlineTests {
  OnlineTests({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory OnlineTests.fromJson(Map<String, dynamic> json) => OnlineTests(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
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
  dynamic image;
  int courseId;
  int subjectId;
  DateTime quizDateAndTime;
  String duration;
  String description;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}
