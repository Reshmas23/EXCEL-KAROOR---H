part of 'video_creator_bloc.dart';

sealed class VideoCreatorState extends Equatable {
  const VideoCreatorState();

  @override
  List<Object> get props => [];
}

final class VideoCreatorInitial extends VideoCreatorState {}

final class VideoCreatorLoading extends VideoCreatorState {}

final class VideoCreatorError extends VideoCreatorState {
  final Failure failure;

  const VideoCreatorError({required this.failure});
}

final class VideoManagerCreatedSuccess extends VideoCreatorState {}

final class ImagePickerState extends VideoCreatorState {
  final Uint8List webImage;

  const ImagePickerState(
    this.webImage,
  );
}

final class ImageUploadedSuccessState extends VideoCreatorState {
  final String imageUrl;

  const ImageUploadedSuccessState({required this.imageUrl});
}

final class ImageUploadedFailureState extends VideoCreatorState {
  final Failure failure;

  const ImageUploadedFailureState({required this.failure});
}

final class VideoEditSuccessState extends VideoCreatorState {}
