import 'package:assignment/presentation/blocs/album_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  late final AlbumBloc _albumBloc;

  @override
  void initState() {
    super.initState();
    _albumBloc = BlocProvider.of<AlbumBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _albumBloc.add(LoadAlbums());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumsLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      if (value.isEmpty) {
                        _albumBloc.add(LoadAlbums());
                        return;
                      }
                      _albumBloc.add(SearchAlbums(value));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.albums.length,
                    itemBuilder: (context, index) {
                      final album = state.albums[index];
                      return ListTile(
                        title: Text(album.title),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/album',
                            arguments: album,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is AlbumsLoadingFailed) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
