class GameBody {
  int? game_id;
  String? game_name;
  String? game_publisher;
  double? game_rating;
  String? game_description;
  DateTime? date_uploded;
  String? username;
  String? reviews_count;
  int? publish_year;
  String? imageLink;
  GameBody(
      {this.game_id,
      this.game_name,
      this.game_publisher,
      this.game_description,
      this.date_uploded,
      this.game_rating,
      this.reviews_count,
      this.username,
      this.publish_year,
      this.imageLink});
  Map<String, dynamic> tojson() => {
        "game_id": game_id,
        "game_name": game_name,
        "game_publisher": game_publisher,
        "game_rating": game_rating,
        "date_uploaded": date_uploded.toString(),
        "description": game_description,
        "user_name": username,
        "pulish_year": publish_year,
        "imageLink": imageLink
      };
  factory GameBody.fromJson(Map<String, dynamic> json) {
    return GameBody(
        game_id: json['game_id'],
        game_name: json['game_name'].toString(),
        game_description: json['description'],
        username: json['user_id'].toString(),
        game_publisher: json['game_publisher'],
        game_rating: json['game_rating'],
        imageLink: json['imageLink'].toString(),
        date_uploded: DateTime.now(),
        publish_year: json['pulish_year']);
  }
}
