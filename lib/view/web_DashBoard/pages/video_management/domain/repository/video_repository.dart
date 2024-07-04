import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/failures.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/entity/video_entity.dart';

abstract class VideoRepository {
  Future<Either<Failure, List<VideoEntity>>> getAllVideos();
  Future<Either<Failure, Unit>> create(VideoEntity videoEntity);
  Future<Either<Failure, Uint8List>> pickImageFromGallery();
  Future<Either<Failure, String>> imageRemoteUpload(Uint8List image);
  Future<Either<Failure, Unit>> deleteVideo(String id);
  Future<Either<Failure, Unit>> edit(VideoEntity videoEntity);
}
