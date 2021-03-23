library cryptoutils.test.fixedsizedhashes;

import 'package:cryptoutils/cryptoutils.dart';
import 'package:test/test.dart';

void _testBigInteger() {
  Hash160 hash = new Hash160(BigInt.one);
  expect(hash.lengthInBytes, equals(20));
}

void main() {
  group('hashes.fixed-sized-hashes', () {
    test('biginteger', _testBigInteger);
  });
}
