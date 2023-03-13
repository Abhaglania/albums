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

class AlbumsLoadingFailed extends AlbumState {
  final String message;

  AlbumsLoadingFailed({required this.message});

  @override
  List<Object> get props => [message];
}
