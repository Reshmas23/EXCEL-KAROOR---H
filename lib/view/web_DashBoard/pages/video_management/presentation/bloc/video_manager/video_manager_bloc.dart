import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/failures.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/entity/video_entity.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/usecases/delete_video_usecase.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/domain/usecases/get_video_usecase.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/usecase/usecase.dart';


part 'video_manager_event.dart';
part 'video_manager_state.dart';

class VideoManagerBloc extends Bloc<VideoManagerEvent, VideoManagerState> {
  final GetVideoUseCase getVideoUseCase;
  final DeleteVideoUseCase deleteVideoUseCase;

  VideoManagerBloc({
    required this.getVideoUseCase,
    required this.deleteVideoUseCase,
  }) : super(VideoManagerInitial()) {
    on<VideoManagerFetchEvent>(
      (event, emit) async {
        emit(VideoManagerLoading());
        final Either<Failure, List<VideoEntity>> videos =
            await getVideoUseCase(NoParams());
        await videos.fold(
            (failure) async => emit(VideoManagerError(failure: failure)),
            (videos) async => emit(VideoManagerLoaded(videos: videos)));
      },
    );
    on<VideoManagerDeleteEvent>(
      (event, emit) async {
        emit(VideoManagerLoading());
        final videos = await deleteVideoUseCase(event.id);
        await videos.fold(
            (failure) async => emit(VideoManagerError(failure: failure)),
            (videos) async => emit(VideoMangerDeleteSuccessState()));
      },
    );
  }
}
