library cryptoutils.test.bigintutils;

import 'dart:math' as Mathx;

import 'package:cryptoutils/cryptoutils.dart';
import 'package:test/test.dart';

bool TEST_EXTRA_LARGE = true;
run_sequence(t) {
  if (TEST_EXTRA_LARGE) {
    for (int i = 0; i < 100; i++) {
      t();
    }
  } else {
    t();
  }
}

void main() {
  group('bigint.byte-array-conversion', () {
    test('byteArrayConv', () {
      // from dart-bignum
      // https://github.com/dartist/dart-bignum/blob/7966a5a021072db14c757b81b1c24569050e9a39/test/test_big_integer_dartvm.dart#L341
      Mathx.Random rnd = new Mathx.Random();
      t() {
        BigInt x =
            BigInt.parse(rnd.nextInt(100000000).toRadixString(16), radix: 16);
        if (x == BigInt.zero) {
          x = x + BigInt.one;
        }

        BigInt y = CryptoUtils.bytesToBigInt(CryptoUtils.bigIntToByteArray(x));
        expect(y.toString(), equals(x.toString()));
      }

      ;

      run_sequence(t);
    });
  });
}
