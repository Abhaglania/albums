import 'package:assignment/presentation/blocs/album_bloc.dart';
import 'package:assignment/presentation/widgets/album_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  late final TextEditingController _searchController;
  late final AlbumBloc _albumBloc;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _albumBloc = BlocProvider.of<AlbumBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _albumBloc.add(LoadAlbums());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            final albums = state.albums;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      if (query.isEmpty) {
                        _albumBloc.add(LoadAlbums());
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search by title',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          if (_searchController.text.isNotEmpty) {
                            _albumBloc
                                .add(SearchAlbums(_searchController.text));
                          } else {
                            _albumBloc.add(LoadAlbums());
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      final album = albums[index];
                      return AlbumItem(
                        album: album,
                        onTap: () async {
                          await Navigator.pushNamed(context, '/album',
                              arguments: album);
                          _albumBloc.add(LoadAlbums());
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Text('Failed to load albums'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
