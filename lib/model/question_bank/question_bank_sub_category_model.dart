// To parse this JSON data, do
//
// final questionBankSubCategoryModel = questionBankSubCategoryModelFromJson(jsonString);

import 'dart:convert';

QuestionBankSubCategoryModel questionBankSubCategoryModelFromJson(String str) => QuestionBankSubCategoryModel.fromJson(json.decode(str));

String questionBankSubCategoryModelToJson(QuestionBankSubCategoryModel data) => json.encode(data.toJson());

class QuestionBankSubCategoryModel {
  QuestionBankSubCategoryModel({
    this.isSuccess,
    this.message,
    this.subCategory,
  });

  bool isSuccess;
  List<String> message;
  SubCategory subCategory;

  factory QuestionBankSubCategoryModel.fromJson(Map<String, dynamic> json) => QuestionBankSubCategoryModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    subCategory: SubCategory.fromJson(json["sub_category"]),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "sub_category": subCategory.toJson(),
  };
}

class SubCategory {
  SubCategory({
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

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
