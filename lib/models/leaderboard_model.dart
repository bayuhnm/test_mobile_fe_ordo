class LeaderboardModel {
  final String imageUrl;
  final String name;
  final String date;
  final int deals;

  LeaderboardModel({
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.deals,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      imageUrl: json['image_url'],
      name: json['name'],
      date: json['date'],
      deals: json['deals'],
    );
  }
}
