import 'package:flutter_test/flutter_test.dart';
import 'package:admin/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DashboardViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}