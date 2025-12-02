class Game {
final int id;
final String title;
final String platform;
final String genre;
final double rating;
final String reviewExcerpt;
final String releaseDate; // kept as String for simplicity
final String developer;
final String coverUrl;
final String reviewText;


Game({
required this.id,
required this.title,
required this.platform,
required this.genre,
required this.rating,
required this.reviewExcerpt,
required this.releaseDate,
required this.developer,
required this.coverUrl,
required this.reviewText,
});


factory Game.fromJson(Map<String, dynamic> json) => Game(
id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
title: json['title'] ?? '',
platform: json['platform'] ?? '',
genre: json['genre'] ?? '',
rating: (json['rating'] as num).toDouble(),
reviewExcerpt: json['review_excerpt'] ?? '',
releaseDate: json['release_date'] ?? '',
developer: json['developer'] ?? '',
coverUrl: json['cover_url'] ?? '',
reviewText: json['review_text'] ?? '',
);


Map<String, dynamic> toJson() => {
'id': id,
'title': title,
'platform': platform,
'genre': genre,
'rating': rating,
'review_excerpt': reviewExcerpt,
'release_date': releaseDate,
'developer': developer,
'cover_url': coverUrl,
'review_text': reviewText,
};
}