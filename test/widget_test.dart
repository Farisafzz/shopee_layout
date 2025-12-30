import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const TokoApp());

    // Cek apakah judul tampil
    expect(find.text('Toko Online'), findsOneWidget);
  });
}
