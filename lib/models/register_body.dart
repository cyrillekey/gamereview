class RegisterBody {
  String? user_name;
  String? user_email;
  DateTime? date_joined;
  String? user_password;
  double? latitude;
  double? longitude;
  String? location_name;

  RegisterBody(
      {this.user_email,
      this.user_name,
      this.date_joined,
      this.user_password,
      this.latitude,
      this.location_name,
      this.longitude});
  factory RegisterBody.fromJson(Map<String, dynamic> json) {
    return RegisterBody(
        user_email: json['email'],
        user_password: json['password'],
        user_name: json['user_name'],
        date_joined: DateTime.now(),
        latitude: json['latitude'],
        longitude: json['longitude'],
        location_name: json['location']);
  }
  Map<String, dynamic> toJson() => {
        "user_email": user_email,
        "user_name": user_name,
        "user_password": user_password,
        "latitude": latitude,
        "longitude": longitude,
        "location_name": location_name,
        "date_joined": date_joined
      };
}
