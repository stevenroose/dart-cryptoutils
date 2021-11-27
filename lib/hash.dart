library cryptoutils.hash;

import "dart:typed_data";

import "package:collection/collection.dart" show ListEquality;
import 'package:cryptoutils/utils.dart';

part "src/hash/fixed-sized-hashes.dart";

/**
 * Data object to represent a hash value.
 *
 * Constructors take either List<int>'s or Strings.
 */
abstract class Hash {
  /**
   * Create a new Hash instance.
   */
  factory Hash(dynamic content) => new _HashBase(content);

  /**
   * Access the underlying bytes of the hash value.
   *
   * This is the default way to access the content of this hash value.
   *
   * This returns an unmodifiable version of this hash value,
   * if you want to modify the bytes, use hash.buffer.asUint8List();
   */
  Uint8List get bytes;

  /**
   * The bytes that represent the hash value. (Same as [bytes] getter.)
   */
  Uint8List asBytes();

  /**
   * The hash value as a Big Integer.
   */
  BigInt asBigInteger();

  /**
   * Copy this hash value as a byte list.
   */
  Uint8List copyAsBytes();

  /**
   * Copy this hash value as a Big Integer.
   */
  BigInt copyAsBigInteger();

  /**
   * Hexadecimal representation of this hash value.
   */
  String toHex();

  /**
   * Convert to JSON encodable. Returns hex string.
   *
   * This method is used by default by dart:convert's JsonEncoder.
   */
  toJson();

  /**
   * Same as [toHex()].
   */
  @override
  String toString();

  /**
   * Compares the internal byte values or both hash values.
   */
  @override
  bool operator ==(Object other);

  /**
   * Gives a hashcode for the hash value.
   */
  @override
  int get hashCode;
}

class _HashBase implements Hash {
  late Uint8List _content;

  _HashBase(dynamic content) {
    // convert
    if (content is String) {
      content = CryptoUtils.hexToBytes(content);
    } else if (content is! BigInt) {
      content = content.toByteArray();
    } else {
      content = CryptoUtils.bigIntToByteArray(content);
    }
    // store as bytes
    if (content is TypedData) {
      _content = new Uint8List.fromList(content.buffer
          .asUint8List(content.offsetInBytes, content.lengthInBytes));
    } else {
      _content = new Uint8List.fromList(content);
    }
  }

  @override
  Uint8List get bytes => _content;

  @override
  Uint8List asBytes() => bytes;

  @override
  BigInt asBigInteger() => CryptoUtils.bytesToBigInt(asBytes());

  @override
  Uint8List copyAsBytes() => new Uint8List.fromList(_content);

  @override
  BigInt copyAsBigInteger() => CryptoUtils.bytesToBigInt(copyAsBytes());

  @override
  String toHex() => CryptoUtils.bytesToHex(_content);

  @override
  toJson() => toHex();

  // TypedData
  @override
  ByteBuffer get buffer => _content.buffer;

  @override
  int get elementSizeInBytes => lengthInBytes;

  @override
  int get lengthInBytes => _content.lengthInBytes;

  @override
  int get offsetInBytes => _content.offsetInBytes;

  // Object methods

  @override
  String toString() => toHex();

  @override
  bool operator ==(Object other) =>
      other is Hash && new ListEquality().equals(_content, other.bytes);

  @override
  int get hashCode {
    if (_content.length < 4) return new ListEquality().hash(_content);
    return _content[_content.length - 1] ^
        (_content[_content.length - 2] << 8) ^
        (_content[_content.length - 3] << 16) ^
        (_content[_content.length - 4] << 24);
  }
}
