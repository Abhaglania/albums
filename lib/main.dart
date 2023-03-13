import 'package:assignment/presentation/blocs/album_bloc.dart';
import 'package:assignment/presentation/screens/album_list_screen.dart';
import 'package:assignment/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/album_repository.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);
  final albumRepository = AlbumRepository(apiService: apiService);
  final albumBloc = AlbumBloc(albumRepository: albumRepository);
  runApp(MyApp(
    albumBloc: albumBloc,
  ));
}

class MyApp extends StatelessWidget {
  final AlbumBloc albumBloc;

  const MyApp({super.key, required this.albumBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
              value: albumBloc,
              child: const AlbumListScreen(),
            ),
        //  '/album': (context) => AlbumDetailScreen(),
      },
    );
  }
}
