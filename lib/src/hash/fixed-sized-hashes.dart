part of cryptoutils;

abstract class _FixedSizeHash extends _HashBase {

  _FixedSizeHash(dynamic bytes, int supposedSize) {
    if(bytes is String)
      bytes = CryptoUtils.hexToBytes(bytes);
    if(bytes.length != supposedSize)
      throw new FormatException("The input byte array is supposed to be of size $supposedSize");
    if(bytes is Uint8List)
      _bytes = bytes;
    else
      _bytes = new Uint8List.fromList(bytes);
  }

}


class Hash128 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 16;
  static final Hash128 ZERO_HASH = new Hash128(new Uint8List(LENGTH));
  Hash128(dynamic bytes) : super(bytes, LENGTH);
  @override
  int get length => LENGTH;
}

class Hash160 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 20;
  static final Hash160 ZERO_HASH = new Hash160(new Uint8List(LENGTH));
  Hash160(dynamic bytes) : super(bytes, LENGTH);
  @override
  int get length => LENGTH;
}

class Hash256 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 32;
  static final Hash256 ZERO_HASH = new Hash256(new Uint8List(LENGTH));
  Hash256(dynamic bytes) : super(bytes, LENGTH);
  @override
  int get length => LENGTH;
}

class Hash512 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 64;
  static final Hash512 ZERO_HASH = new Hash512(new Uint8List(LENGTH));
  Hash512(dynamic bytes) : super(bytes, LENGTH);
  @override
  int get length => LENGTH;
}