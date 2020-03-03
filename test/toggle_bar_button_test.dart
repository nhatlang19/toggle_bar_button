import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toggle_bar_button/toggle_bar_button.dart';

void main() {
  const MethodChannel channel = MethodChannel('toggle_bar_button');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ToggleBarButton.platformVersion, '42');
  });
}
