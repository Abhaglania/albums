import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/data/models/photo_model.dart';
import 'package:assignment/data/repositories/album_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/annotations.dart';

part 'album_event.dart';

part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository;

  AlbumBloc({required this.albumRepository}) : super(AlbumsLoading()) {
    on((event, emit) async {
      if (event is LoadAlbums) {
        emit(AlbumsLoading());
        try {
          final albums = await albumRepository.getAlbums();
          emit(AlbumsLoaded(albums: albums));
        } catch (e) {
          emit(ErrorState(message: e.toString()));
        }
      } else if (event is SearchAlbums) {
        final query = event.query.toLowerCase();
        try {
          final albums = await albumRepository.searchAlbums(query);
          emit(AlbumsLoaded(albums: albums));
        } catch (e) {
          emit(ErrorState(message: e.toString()));
        }
      } else if (event is AlbumPhotos) {
        final albumId = event.albumId;
        emit(AlbumsLoading());
        try {
          final List<PhotoModel> photos =
              await albumRepository.getAlbumPhotos(albumId);
          emit(AlbumPhotosLoaded(photos: photos));
        } catch (e) {
          emit(ErrorState(message: e.toString()));
        }
      }
    });
  }
}
