part of 'video_manager_bloc.dart';

sealed class VideoManagerState extends Equatable {
  const VideoManagerState();

  @override
  List<Object> get props => [];
}

final class VideoManagerInitial extends VideoManagerState {}

final class VideoManagerLoading extends VideoManagerState {}

final class VideoManagerLoaded extends VideoManagerState {
  final List<VideoEntity> videos;

  const VideoManagerLoaded({required this.videos});
}

final class VideoManagerError extends VideoManagerState {
  final Failure failure;

  const VideoManagerError({required this.failure});
}

final class VideoMangerDeleteSuccessState extends VideoManagerState {}
