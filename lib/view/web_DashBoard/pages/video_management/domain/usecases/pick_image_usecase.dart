import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/failures.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/usecase/usecase.dart';


import '../repository/video_repository.dart';

class PickImageUseCase extends UseCase<Uint8List, NoParams> {
  final VideoRepository repo;

  PickImageUseCase({
    required this.repo,
  });
  @override
  Future<Either<Failure, Uint8List>> call(NoParams params) async {
    return await repo.pickImageFromGallery();
  }
}
