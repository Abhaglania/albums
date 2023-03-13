part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsLoading extends AlbumState {}

class AlbumsLoaded extends AlbumState {
  final List<AlbumModel> albums;

  AlbumsLoaded({required this.albums});

  @override
  List<Object> get props => [albums];
}

class ErrorState extends AlbumState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class AlbumPhotosLoaded extends AlbumState {
  final List<PhotoModel> photos;

  AlbumPhotosLoaded({required this.photos});

  @override
  List<Object> get props => [photos];
}
