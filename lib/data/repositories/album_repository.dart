import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/data/models/photo_model.dart';
import 'package:assignment/services/api_service.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository({required this.apiService});

  Future<List<AlbumModel>> getAlbums() async {
    return await apiService.getAlbums();
  }

  Future<List<AlbumModel>> searchAlbums(String query) async {
    return await apiService.searchAlbumsByTitle(query);
  }

  Future<List<PhotoModel>> getAlbumPhotos(int albumId) async {
    return await apiService.getPhotosForAlbum(albumId);
  }
}
