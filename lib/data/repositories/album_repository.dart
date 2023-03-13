import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/services/api_service.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository({required this.apiService});

  Future<List<AlbumModel>> getAlbums() async {
    return await apiService.getAlbums();
  }
}
