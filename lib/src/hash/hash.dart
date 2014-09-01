part of cryptoutils;

/**
 * Data object to represent a hash value.
 *
 * Constructors take either List<int>'s or Strings.
 */
abstract class Hash implements TypedData {

  /**
   * The bytes that represent the hash value.
   */
  List<int> get bytes;

  /**
   * The size of this hash in bytes.
   */
  int get length;

  BigInteger asBigInteger();

  @override
  ByteBuffer get buffer;

  @override
  int get elementSizeInBytes;

  @override
  int get lengthInBytes;

  @override
  int get offsetInBytes;

  /**
   * Hexadecimal representation of this hash value.
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

abstract class _HashBase implements Hash {

  Uint8List _bytes;

  @override
  List<int> get bytes => _bytes;

  @override
  int get length => _bytes.length;

  @override
  BigInteger asBigInteger() => new BigInteger.fromBytes(1, _bytes);

  // TypedData methods

  @override
  ByteBuffer get buffer => _bytes.buffer;

  @override
  int get elementSizeInBytes => _bytes.elementSizeInBytes;

  @override
  int get lengthInBytes => _bytes.lengthInBytes;

  @override
  int get offsetInBytes => _bytes.offsetInBytes;

  // Object methods

  @override
  String toString() => CryptoUtils.bytesToHex(bytes);

  @override
  bool operator ==(Object other) => other is! Hash ? false :
      new ListEquality().equals(_bytes, (other as Hash).bytes);

  @override
  int get hashCode {
    return _bytes[_bytes.length-1] | (_bytes[_bytes.length-2] << 8) | (_bytes[_bytes.length-3] << 16) | (_bytes[_bytes.length-4] << 24);
  }
}