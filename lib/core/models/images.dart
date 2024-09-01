import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? imageUrl;
  final String? largeImageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? maximumImageUrl;
  const Image({
    required this.imageUrl,
    required this.largeImageUrl,
    required this.smallImageUrl,
    this.mediumImageUrl,
    this.maximumImageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json,{bool jpg =true}) {

    final images = jpg ?json['jpg'] as Map<String, dynamic>?: json;
    return Image(
        imageUrl: images?['image_url'] as String?,
        largeImageUrl: images?['large_image_url'] as String?,
        smallImageUrl: images?['small_image_url'] as String?,
      mediumImageUrl: images?['medium_image_url'] as String?,
      maximumImageUrl: images?['maximum_image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'jpg': {
      if (imageUrl != null) 'image_url': imageUrl,
      if (largeImageUrl != null) 'large_image_url': largeImageUrl,
      if (smallImageUrl != null) 'small_image_url': smallImageUrl,
      if (mediumImageUrl != null) 'medium_image_url': mediumImageUrl,
      if (maximumImageUrl != null) 'maximum_image_url': maximumImageUrl,
    }
  };

  @override
  List<Object?> get props => [imageUrl, largeImageUrl, smallImageUrl, mediumImageUrl, maximumImageUrl];
}
