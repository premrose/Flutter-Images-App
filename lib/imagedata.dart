class ImageData {
  final String id, image, thumbnail, name, description, downloads, likes, created_at, profileImage;
    //make, model, exposure_time, aperture, iso, focal_length;
  ImageData({
    required this.id,
    required this.image,
    required this.thumbnail,
    required this.name,
    required this.description,
    required this.created_at,
    required this.likes,
    required this.downloads,
    required this.profileImage,
    // required this.make,
    // required this.model,
    // required this.exposure_time,
    // required this.aperture,
    // required this.iso,
    // required this.focal_length,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      image: json['urls']['regular'].toString(),
      thumbnail: json['urls']['small'].toString(),
      id: json['id'],
      created_at: json['created_at'].toString(),
      likes: json['likes'].toString(),
      downloads: json['downloads'].toString(),
      name: json['user']['name'].toString(),
      description: json['description'].toString(),
      profileImage: json['user']['profile_image']['medium'].toString(),
      // make: json['exif']['make'].toString(),
      // model: json['exif']['model'].toString(),
      // exposure_time: json['exif']['exposure_time'].toString(),
      // aperture: json['exif']['aperture'].toString(),
      // iso: json['exif']['iso'].toString(),
      // focal_length: json['exif']['focal_length'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'image': image,
    'thumbnail': thumbnail,
    'id': id,
    'created_at': created_at,
    'likes': likes,
    'downloads': downloads,
    'name': name,
    'description': description,
    'profileImage': profileImage,
    // 'make': make,
    // 'model': model,
    // 'aperture': aperture,
    // 'iso': iso,
    // 'focal_length': focal_length,
  };
}