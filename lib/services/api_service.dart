import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/data/models/photo_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/albums")
  Future<List<AlbumModel>> getAlbums();

  @GET("/albums/{albumId}")
  Future<AlbumModel> getAlbum(@Path("albumId") int albumId);

  @GET("/albums")
  Future<List<AlbumModel>> searchAlbumsByTitle(@Query("title") String title);

  @GET("/albums/{albumId}/photos")
  Future<List<PhotoModel>> getPhotosForAlbum(@Path("albumId") int albumId);
}
