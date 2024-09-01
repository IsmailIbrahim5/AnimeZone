
import 'package:animezone/core/models/images.dart';
import 'package:equatable/equatable.dart';

class Video extends Equatable{

  final String? title;
  final Trailer? trailer;

  const Video({this.title, this.trailer, });


  factory Video.fromJson(Map<String, dynamic> json){

    return Video(title: json['title'] as String?, trailer: Trailer.fromJson(json['trailer'] as Map<String, dynamic>? ?? json['video'] as Map<String,dynamic>? ?? {}));
  }

  Map<String, dynamic> toJson()=>{
    if(title != null) 'title' : title,
    if(trailer != null) 'trailer': trailer,
  };


  @override
  List<Object?> get props => [title , trailer];

}

class Trailer extends Equatable{
  final String? id;
  final String? url;
  final String? embedUrl;
  final Image? images;


  const Trailer({this.id, this.url, this.embedUrl, this.images});

  factory Trailer.fromJson(Map<String, dynamic> json)=> Trailer(id: json['youtube_id'] as String?, embedUrl: json['embed_url'] as String? ,  images: Image.fromJson(json['images'] as Map<String, dynamic>, jpg: false) ,  url: json['url'] as String?);

  Map<String, dynamic> toJson()=>{
    if(id != null) 'youtube_id' : url,
    if(url != null) 'url': url,
    if(embedUrl != null) 'embed_url': embedUrl,
    if(images != null) 'images': images!.toJson(),
  };


  @override
  List<Object?> get props => [id, url , embedUrl , images];

}