class Review {
  int? review_id;
  double? review_rating;
  String? review;
  DateTime? review_time;
  String? user_name;
  String? game_id;
  Review(
      {this.user_name,
      this.review,
      this.game_id,
      this.review_id,
      this.review_rating,
      this.review_time});
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        user_name: json['user_name'],
        review_rating: json['review_rating'],
        review: json['review'],
        review_time: DateTime.now(),
        game_id: json['game_id']);
  }
  Map<String, dynamic> toJson() => {
        "review_id": review_id,
        "game_name": game_id,
        "user_name": user_name,
        "review": review,
        "date_posted": review_time.toString(),
        "ratings": review_rating
      };
}
