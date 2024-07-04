import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/failures.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/usecase/usecase.dart';

import '../repository/video_repository.dart';

class ImageUploadUseCase extends UseCase<String, Uint8List> {
  final VideoRepository repo;

  ImageUploadUseCase({
    required this.repo,
  });
  @override
  Future<Either<Failure, String>> call(Uint8List params) async {
    return await repo.imageRemoteUpload(params);
  }
}
