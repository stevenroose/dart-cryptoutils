part of cryptoutils;

/**
 * Data object to represent a hash value.
 *
 * Constructors take either List<int>'s or Strings.
 */
abstract class Hash implements TypedData {

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
  BigInteger asBigInteger();

  /**
   * Copy this hash value as a byte list.
   */
  Uint8List copyAsBytes();

  /**
   * Copy this hash value as a Big Integer.
   */
  BigInteger copyAsBigInteger();

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

class _HashBase implements Hash  {

  UnmodifiableUint8List _content;

  _HashBase(dynamic content) {
    // convert
    if(content is String)
      content = CryptoUtils.hexToBytes(content);
    else if(content is BigInteger)
      content = content.toByteArray();
    // make immutable
    if(content is UnmodifiableUint8List)
      _content = content;
    else if(content is Uint8List)
      _content = new UnmodifiableUint8List(content);
    else if(content is TypedData)
      _content = new UnmodifiableUint8List.fromList(content.buffer.asUint8List(content.offsetInBytes, content.lengthInBytes));
    else
      _content = new UnmodifiableUint8List.fromList(content);
  }

  @override
  Uint8List get bytes => _content;

  @override
  List<int> asBytes() => bytes;

  @override
  BigInteger asBigInteger() => new BigInteger.fromBytes(1, asBytes());

  @override
  List<int> copyAsBytes() => new Uint8List.fromList(_content);

  @override
  BigInteger copyAsBigInteger() => new BigInteger.fromBytes(1, copyAsBytes());

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
  bool operator ==(Object other) => other is! Hash ? false :
      new ListEquality().equals(_content, (other as Hash).asBytes());

  @override
  int get hashCode {
    if(_content.length < 4) return new ListEquality().hash(_content);
    return _content[_content.length-1] ^ (_content[_content.length-2] << 8) ^ (_content[_content.length-3] << 16) ^ (_content[_content.length-4] << 24);
  }
}