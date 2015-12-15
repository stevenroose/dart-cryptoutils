part of cryptoutils.hash;


class _FixedSizeHash extends _HashBase {

  _FixedSizeHash(dynamic content, int supposedSize) : super(content) {
    // pad the bytes if content was a small BigInteger
    if(content is BigInteger && _content.length < supposedSize) {
      Uint8List newBytes = new Uint8List(supposedSize)
        ..setRange(supposedSize - _content.length, supposedSize, _content);
      _content = new UnmodifiableUint8List(newBytes);
    }
    if(_content.length != supposedSize)
      throw new FormatException("The input byte array is supposed to be of size $supposedSize");
  }
}


class Hash128 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 16;
  static final Hash128 ZERO_HASH = new Hash128(new Uint8List(LENGTH));
  Hash128(dynamic content) : super(content, LENGTH);
  @override
  int get lengthInBytes => LENGTH;
}

class Hash160 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 20;
  static final Hash160 ZERO_HASH = new Hash160(new Uint8List(LENGTH));
  Hash160(dynamic content) : super(content, LENGTH);
  @override
  int get lengthInBytes => LENGTH;
}

class Hash256 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 32;
  static final Hash256 ZERO_HASH = new Hash256(new Uint8List(LENGTH));
  Hash256(dynamic content) : super(content, LENGTH);
  @override
  int get lengthInBytes => LENGTH;
}

class Hash512 extends _FixedSizeHash implements Hash {
  static const int LENGTH = 64;
  static final Hash512 ZERO_HASH = new Hash512(new Uint8List(LENGTH));
  Hash512(dynamic content) : super(content, LENGTH);
  @override
  int get lengthInBytes => LENGTH;
}