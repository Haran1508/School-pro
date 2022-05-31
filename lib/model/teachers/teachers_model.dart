// To parse this JSON data, do
//
//     final teachersModel = teachersModelFromJson(jsonString);

import 'dart:convert';

TeachersModel teachersModelFromJson(String str) => TeachersModel.fromJson(json.decode(str));

String teachersModelToJson(TeachersModel data) => json.encode(data.toJson());

class TeachersModel {
  TeachersModel({
    this.isSuccess,
    this.message,
    this.teachers,
  });

  bool isSuccess;
  List<String> message;
  Teachers teachers;

  factory TeachersModel.fromJson(Map<String, dynamic> json) => TeachersModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    teachers: Teachers.fromJson(json["teachers"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "teachers": teachers.toJson(),
  };
}

class Teachers {
  Teachers({
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

  factory Teachers.fromJson(Map<String, dynamic> json) => Teachers(
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
    this.type,
    this.name,
    this.email,
    this.image,
    this.experience,
    this.isSubscribed,
  });

  int id;
  int type;
  String name;
  String email;
  dynamic image;
  dynamic experience;
  bool isSubscribed;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    experience: json["experience"],
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "email": email,
    "image": image,
    "experience": experience,
    "is_subscribed": isSubscribed,
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
