import 'package:assignment/data/models/photo_model.dart';
import 'package:flutter/material.dart';

class AlbumPhotoItem extends StatelessWidget {
  final PhotoModel photo;

  const AlbumPhotoItem({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              photo.thumbnailUrl,
              width: 80,
              height: 80,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Text(
                    photo.title,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    photo.thumbnailUrl,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
