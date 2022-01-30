class ImageData {
  final String id, image, thumbnail, name, likes, created_at, profileImage;
  ImageData({
    required this.id,
    required this.image,
    required this.thumbnail,
    required this.name,
    required this.created_at,
    required this.likes,
    required this.profileImage,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      image: json['urls']['regular'].toString(),
      thumbnail: json['urls']['small'].toString(),
      id: json['id'],
      created_at: json['created_at'].toString(),
      likes: json['likes'].toString(),
      name: json['user']['name'].toString(),
      profileImage: json['user']['profile_image']['medium'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'image': image,
    'thumbnail': thumbnail,
    'id': id,
    'created_at': created_at,
    'likes': likes,
    'name': name,
    'profileImage': profileImage,
  };
}