class RecentLeadModel {
  final String icon;
  final String label;
  final String imageUrl;
  final String name;
  final String date;
  final String revenue;

  RecentLeadModel({
    required this.icon,
    required this.label,
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.revenue,
  });

  factory RecentLeadModel.fromJson(Map<String, dynamic> json) {
    return RecentLeadModel(
      icon: json['icon'],
      label: json['label'],
      imageUrl: json['image_url'],
      name: json['name'],
      date: json['date'],
      revenue: json['revenue'],
    );
  }
}
