import 'dart:io';

import 'package:assignment/data/models/photo_model.dart';
import 'package:assignment/presentation/widgets/album_photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => tests();

void tests() {

  setUpAll(() => HttpOverrides.global = null);

  group('Album Photo Item', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      final photoModel = PhotoModel(
        id: 1,
        albumId: 1,
        title: "accusamus beatae ad facilis cum similique qui sunt",
        thumbnailUrl: 'https://via.placeholder.com/150/92c952',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
              child: Material(child: AlbumPhotoItem(photo: photoModel))),
        ),
      );
      await tester.pump(const Duration(seconds: 4));

      expect(find.text(photoModel.title), findsOneWidget);
      expect(find.text(photoModel.thumbnailUrl), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
