part of cryptoutils;

/**
 * Data object to represent a hash value.
 *
 * Constructors take either List<int>'s or Strings.
 */
abstract class Hash implements Uint8List {

  /**
   * Create a new Hash instance.
   */
  factory Hash(dynamic content) => new _HashBase(content);

  /**
   * The bytes that represent the hash value.
   */
  List<int> asBytes();

  /**
   * The hash value as a Big Integer.
   */
  BigInteger asBigInteger();

  /**
   * Copy this hash value as a byte list.
   */
  List<int> copyAsBytes();

  /**
   * Copy this hash value as a Big Integer.
   */
  BigInteger copyAsBigInteger();

  /**
   * Hexadecimal representation of this hash value.
   */
  String toHex();

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

abstract class _HashBase implements Hash  {

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
    else
      _content = new UnmodifiableUint8List.fromList(content);
  }

  @override
  List<int> asBytes() => _content;

  @override
  BigInteger asBigInteger() => new BigInteger.fromBytes(1, _content);

  @override
  List<int> copyAsBytes() => new Uint8List.fromList(_content);

  @override
  BigInteger copyAsBigInteger() => new BigInteger.fromBytes(1, copyAsBytes());

  @override
  String toHex() => CryptoUtils.bytesToHex(_content);

  @override
  noSuchMethod(Invocation invocation) => reflect(_content).delegate(invocation);

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