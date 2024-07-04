import 'package:dartz/dartz.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/failures.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/entity/video_entity.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/repository/video_repository.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/usecase/usecase.dart';


class GetVideoUseCase extends UseCase<List<VideoEntity>, NoParams> {
  final VideoRepository repo;

  GetVideoUseCase({
    required this.repo,
  });
  @override
  Future<Either<Failure, List<VideoEntity>>> call(NoParams params) async {
    return await repo.getAllVideos();
  }
}
