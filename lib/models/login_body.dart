class LoginBody {
  String? user_name = "";
  String? user_password = "";
  LoginBody(this.user_name, this.user_password);
  factory LoginBody.fromJson(Map<String, dynamic> json) {
    return LoginBody(json['user_name'], json['password']);
  }
}
