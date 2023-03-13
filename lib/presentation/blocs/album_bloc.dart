import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/data/repositories/album_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AlbumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadAlbums extends AlbumEvent {}

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

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository;

  AlbumBloc({required this.albumRepository}) : super(AlbumsLoading()) {
    on((event, emit) async {
      if (event is LoadAlbums) {
        AlbumsLoading();
        try {
          final albums = await albumRepository.getAlbums();
          emit(AlbumsLoaded(albums: albums));
        } catch (e) {
          emit(AlbumsLoadingFailed(message: e.toString()));
        }
      }
    });
  }
}
