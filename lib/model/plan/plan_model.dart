// To parse this JSON data, do
//
//     final planModel = planModelFromJson(jsonString);

import 'dart:convert';

PlanModel planModelFromJson(String str) => PlanModel.fromJson(json.decode(str));

String planModelToJson(PlanModel data) => json.encode(data.toJson());

class PlanModel {
  PlanModel({
    this.isSuccess,
    this.message,
    this.plans,
  });

  bool isSuccess;
  List<String> message;
  List<Plan> plans;

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
  };
}

class Plan {
  Plan({
    this.id,
    this.title,
    this.amount,
    this.discountType,
    this.discount,
    this.discountDescription,
    this.total,
    this.description,
    this.isActive,
    this.validityDays,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String amount;
  int discountType;
  String discount;
  String discountDescription;
  String total;
  String description;
  int isActive;
  String validityDays;
  DateTime createdAt;
  DateTime updatedAt;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    discountType: json["discount_type"],
    discount: json["discount"] == null ? null : json["discount"],
    discountDescription: json["discount_description"] == null ? null : json["discount_description"],
    total: json["total"],
    description: json["description"],
    isActive: json["is_active"],
    validityDays: json["validity_days"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "amount": amount,
    "discount_type": discountType,
    "discount": discount == null ? null : discount,
    "discount_description": discountDescription == null ? null : discountDescription,
    "total": total,
    "description": description,
    "is_active": isActive,
    "validity_days": validityDays,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
