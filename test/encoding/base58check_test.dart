library cryptoutils.test.base58;

import "package:unittest/unittest.dart";
import "package:cryptoutils/cryptoutils.dart";

import "dart:typed_data";
import "dart:convert";
import "package:crypto/crypto.dart" show SHA256;

// bitcoinj

String _alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
List _sha(List bytes) {
  SHA256 sha = new SHA256();
  sha.add(bytes);
  return sha.close();
}

Base58CheckCodec _codec = new Base58CheckCodec(_alphabet, _sha);

//void _testEncode() {
//  Uint8List testbytes = new Uint8List.fromList(new Utf8Encoder().convert("Hello World"));
//  expect(_codec.encode(testbytes), equals("JxF12TrwUP45BMd"));
//  Uint8List testBytesAgain = new Uint8List.fromList(new Utf8Encoder().convert("Hello World"));
//  expect(testbytes, equals(testBytesAgain));
//
//  BigInteger bi = new BigInteger(3471844090);
//  expect(_codec.encode(new Uint8List.fromList(bi.toByteArray())), equals("16Ho7Hs"));
//
//  Uint8List zeroBytes1 = new Uint8List(1);
//  expect(_codec.encode(zeroBytes1), equals("1"));
//
//  Uint8List zeroBytes7 = new Uint8List(7);
//  expect(_codec.encode(zeroBytes7), equals("1111111"));
//
//  // test empty encode
//  expect(_codec.encode(new Uint8List(0)), equals(""));
//}


void _testDecode() {
  List testBytes = new Utf8Encoder().convert("Hello World");
  var decoded = _codec.decode("JxF12TrwUP45BMd");
  List actualBytes = [decoded.version]..addAll(decoded.payload);
  expect(actualBytes, equals(testBytes));

  expect(_codec.decode("1"), equals(new Uint8List(1)));
  expect(_codec.decode("1111"), equals(new Uint8List(4)));

  expect(() => _codec.decode("This isn't valid base58"), throwsFormatException);

  expect(() => _codec.decode("4stwEBjT6FYyVV"), returnsNormally);

  // Checksum should fail.
  expect(() => _codec.decode("4stwEBjT6FYyVW"), throwsFormatException);

  // Input is too short.
  expect(() => _codec.decode("4s"), throwsFormatException);

  // Test decode of empty String.
  expect(_codec.decode("").payload.length, equals(0));

  // Now check we can correctly decode the case where the high bit of the first byte is not zero, so BigInteger
  // sign extends. Fix for a bug that stopped us parsing keys exported using sipas patch.
  expect(() => _codec.decode("93VYUMzRG9DdbRP72uQXjaWibbQwygnvaCu9DumcqDjGybD864T"), returnsNormally);
}

main() {
  group("core.Base58Check", () {
//    test("encode", () => _testEncode());
    test("decode", () => _testDecode());
  });
}



