import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/presentation/blocs/album_bloc.dart';
import 'package:assignment/presentation/widgets/album_photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPhotosPage extends StatelessWidget {
  const AlbumPhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final album = ModalRoute.of(context)!.settings.arguments as AlbumModel;
    context.read<AlbumBloc>().add(AlbumPhotos(album.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('${album.title} Photos'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumPhotosLoaded) {
            return ListView.builder(
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return AlbumPhotoItem(
                  photo: state.photos[index],
                );
              },
            );
          } else if (state is AlbumsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Failed to load album photos.'),
            );
          }
        },
      ),
    );
  }
}
