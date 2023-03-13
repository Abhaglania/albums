import 'package:assignment/data/models/album_model.dart';
import 'package:assignment/presentation/widgets/album_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => tests();

void tests() {
  group('Album Item', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      final album = AlbumModel(
        id: 1,
        title: 'quidem molestiae enim',
        userId: 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Material(child: Material(child: AlbumItem(album: album))),
        ),
      );
      await tester.pump(const Duration(seconds: 4));

      expect(find.text(album.title), findsOneWidget);
    });
  });
}
