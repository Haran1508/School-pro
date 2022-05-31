// To parse this JSON data, do
//
//     final questionBankModel = questionBankModelFromJson(jsonString);

import 'dart:convert';

QuestionBankModel questionBankModelFromJson(String str) => QuestionBankModel.fromJson(json.decode(str));

String questionBankModelToJson(QuestionBankModel data) => json.encode(data.toJson());

class QuestionBankModel {
  QuestionBankModel({
    this.isSuccess,
    this.message,
    this.category,
  });

  bool isSuccess;
  List<String> message;
  Category category;

  factory QuestionBankModel.fromJson(Map<String, dynamic> json) => QuestionBankModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "category": category.toJson(),
  };
}

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
    this.parentId,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.image,
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
  dynamic parentId;
  String slug;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  dynamic image;
  int status;
  String shortDescription;
  dynamic createdBy;
  dynamic position;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int chapterscount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    parentId: json["parent_id"],
    slug: json["slug"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    image: json["image"],
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
    "slug": slug,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "image": image,
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
