import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String id;
  final String url;
  final String title;
  final String subtitle;
  final String description;
  final int uploadedDate;
  final String thumbnailurl;
  final int createdAt;

  const VideoEntity({
    required this.url,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.uploadedDate,
    required this.thumbnailurl,
    required this.createdAt,
    required this.id,
  });

  factory VideoEntity.empty() {
    return const VideoEntity(
        url: "",
        title: "",
        subtitle: "",
        description: "",
        uploadedDate: -1,
        thumbnailurl: "",
        createdAt: -1,
        id: "");
  }
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
}
