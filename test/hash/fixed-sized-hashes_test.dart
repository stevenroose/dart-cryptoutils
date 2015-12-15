library cryptoutils.test.fixedsizedhashes;

import "package:unittest/unittest.dart";

import "package:cryptoutils/cryptoutils.dart";
import "package:bignum/bignum.dart";

void _testBigInteger() {
  Hash160 hash = new Hash160(BigInteger.ONE);
  expect(hash.lengthInBytes, equals(20));
}

void main() {
  group("hashes.fixed-sized-hashes", () {
    test("biginteger", () => _testBigInteger());
  });
}