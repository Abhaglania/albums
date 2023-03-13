import 'package:assignment/data/models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  final AlbumModel album;
  final VoidCallback? onTap;

  const AlbumItem({
    Key? key,
    required this.album,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                album.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
