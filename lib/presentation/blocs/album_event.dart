part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class LoadAlbums extends AlbumEvent {}

class SearchAlbums extends AlbumEvent {
  final String query;

  const SearchAlbums(this.query);

  @override
  List<Object> get props => [query];
}
