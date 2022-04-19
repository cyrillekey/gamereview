

import 'login_body.dart';

class User {
  int? user_id = 0;
  String? user_name = "";
  String? user_email = "";
  DateTime? date_joined = DateTime.now();
  double? latitude = 0.0;
  double? longitude = 0.0;
  String? user_password = "";
  String? location = "";
  User(
      {this.user_id,
      this.user_name,
      this.user_email,
      this.date_joined,
      this.latitude,
      this.longitude,
      this.user_password,
      this.location});
  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "user_name": user_name,
        "user_email": user_email,
        "date_joined": date_joined,
        "latitude": latitude,
        "longitude": longitude,
        "user_password": user_password
      };
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        user_id: json["user_id"],
        user_name: json['user_name'],
        user_email: json['user_email'],
        date_joined: json['date_joined'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        user_password: json['user_password']);
  }
}
