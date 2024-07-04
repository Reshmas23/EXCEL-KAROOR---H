part of 'video_manager_bloc.dart';

sealed class VideoManagerEvent extends Equatable {
  const VideoManagerEvent();

  @override
  List<Object> get props => [];
}

class VideoManagerFetchEvent extends VideoManagerEvent {}

class VideoManagerDeleteEvent extends VideoManagerEvent {
  final String id;

  const VideoManagerDeleteEvent({required this.id});
}
