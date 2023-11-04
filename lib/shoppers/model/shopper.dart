import 'dart:convert';

class Shopper {
  int shopper_id;
  String shopper_username;
  String shopper_email;
  String shopper_password;

  Shopper(
    this.shopper_id,
    this.shopper_username,
    this.shopper_email,
    this.shopper_password,
  );

  factory Shopper.fromJson(Map<String, dynamic> json) => Shopper(
    int.parse(json["shopper_id"]),
    json["shopper_username"],
    json["shopper_email"],
    json["shopper_password"],
  );

  Map<String, dynamic> toJson() => {
    'shopper_id': shopper_id.toString(),
    'shopper_username': shopper_username,
    'shopper_email': shopper_email,
    'shopper_password': shopper_password,
  };
}