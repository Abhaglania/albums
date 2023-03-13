class PhotoModel {
  final int id;
  final int albumId;
  final String title;
  final String thumbnailUrl;

  PhotoModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] as int,
      albumId: json['albumId'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
