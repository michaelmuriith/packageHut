import 'package:flutter_test/flutter_test.dart';
import 'package:shop/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('VendorshopViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
