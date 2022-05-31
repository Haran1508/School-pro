// To parse this JSON data, do
//
//     final questionBankSubCategoryPdfModel = questionBankSubCategoryPdfModelFromJson(jsonString);

import 'dart:convert';

QuestionBankSubCategoryPdfModel questionBankSubCategoryPdfModelFromJson(String str) => QuestionBankSubCategoryPdfModel.fromJson(json.decode(str));

String questionBankSubCategoryPdfModelToJson(QuestionBankSubCategoryPdfModel data) => json.encode(data.toJson());

class QuestionBankSubCategoryPdfModel {
  QuestionBankSubCategoryPdfModel({
    this.isSuccess,
    this.message,
    this.chapters,
  });

  bool isSuccess;
  List<String> message;
  Chapters chapters;

  factory QuestionBankSubCategoryPdfModel.fromJson(Map<String, dynamic> json) => QuestionBankSubCategoryPdfModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    chapters: Chapters.fromJson(json["chapters"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "chapters": chapters.toJson(),
  };
}

class Chapters {
  Chapters({
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

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
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
    this.questionBankCategoryId,
    this.pdfPath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int questionBankCategoryId;
  String pdfPath;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    questionBankCategoryId: json["question_bank_category_id"],
    pdfPath: json["pdf_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "question_bank_category_id": questionBankCategoryId,
    "pdf_path": pdfPath,
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
