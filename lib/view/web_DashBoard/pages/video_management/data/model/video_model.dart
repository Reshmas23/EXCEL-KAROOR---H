// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/entity/video_entity.dart';

class VideoModel extends Equatable {
  final String? id;
  final String? url;
  final String? title;
  final String? subtitle;
  final String? description;
  final int? uploadedDate;
  final String? thumbnailurl;
  final int? createdAt;

  const VideoModel({
    required this.url,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.uploadedDate,
    required this.thumbnailurl,
    required this.createdAt,
    required this.id,
  });
  @override
  List<Object?> get props => [
        url,
        title,
        subtitle,
        description,
        uploadedDate,
        thumbnailurl,
        createdAt,
        id,
      ];

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        url: json["url"] ?? "",
        title: json["title"] ?? "",
        subtitle: json["subtitle"] ?? "",
        description: json["description"] ?? "",
        uploadedDate: json["uploadedDate"] ?? -1,
        thumbnailurl: json["thumbnailurl"] ?? "",
        createdAt: json["createdAt"] ?? -1,
        id: json["id"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "title": title,
      "subtitle": subtitle,
      "description": description,
      "uploadedDate": uploadedDate,
      "thumbnailurl": thumbnailurl,
      "createdAt": createdAt,
      "id": id,
    };
  }

  VideoEntity toDomain() {
    return VideoEntity(
      url: url ?? "",
      title: title ?? "",
      subtitle: subtitle ?? "",
      description: description ?? "",
      uploadedDate: uploadedDate ?? -1,
      thumbnailurl: thumbnailurl ?? "",
      createdAt: createdAt ?? -1,
      id: id ?? "",
    );
  }

  factory VideoModel.fromDomain(VideoEntity video) {
    return VideoModel(
      url: video.url,
      title: video.title,
      subtitle: video.subtitle,
      description: video.description,
      uploadedDate: video.uploadedDate,
      thumbnailurl: video.thumbnailurl,
      createdAt: video.createdAt,
      id: video.id,
    );
  }

  VideoModel copyWith({
    String? id,
    String? url,
    String? title,
    String? subtitle,
    String? description,
    int? uploadedDate,
    String? thumbnailurl,
    int? createdAt,
  }) {
    return VideoModel(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      uploadedDate: uploadedDate ?? this.uploadedDate,
      thumbnailurl: thumbnailurl ?? this.thumbnailurl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool get stringify => true;
}
