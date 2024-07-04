import 'package:dartz/dartz.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/failures.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/repository/video_repository.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/usecase/usecase.dart';


class DeleteVideoUseCase extends UseCase<Unit, String> {
  final VideoRepository repo;

  DeleteVideoUseCase({
    required this.repo,
  });
  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await repo.deleteVideo(params);
  }
}
