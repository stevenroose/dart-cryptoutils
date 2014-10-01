part of cryptoutils;


class Base58CheckPayload {
  final int version;
  final List<int> payload;
  const Base58CheckPayload(int this.version, List<int> this.payload);
}

/**
 * A codec for Base58Check, a binary-to-string encoding used
 * in cryptocurrencies like Bitcoin and Ripple.
 *
 * The constructor requires the alphabet and a function that
 * performs a SINGLE-round SHA-256 digest on a [List<int>] and
 * returns a [List<int>] as result.
 *
 * For all details about Base58Check, see the Bitcoin wiki page:
 * https://en.bitcoin.it/wiki/Base58Check_encoding
 */
class Base58CheckCodec extends Codec<Base58CheckPayload, String> {

  final String alphabet;
  final Function sha256;

  const Base58CheckCodec(String this.alphabet, Function this.sha256);

  @override
  Converter<Base58CheckPayload, String> get encoder => new Base58CheckEncoder(alphabet, sha256);

  @override
  Converter<String, Base58CheckPayload> get decoder => new Base58CheckDecoder(alphabet, sha256);

  Base58CheckPayload decodeUnchecked(String encoded) =>
      new Base58CheckDecoder(alphabet, sha256).convertUnchecked(encoded);
}

class Base58CheckEncoder extends Converter<Base58CheckPayload, String> {

  final String alphabet;
  final Function sha256;

  const Base58CheckEncoder(String this.alphabet, Function this.sha256);

  @override
  String convert(Base58CheckPayload payload) {
    Uint8List bytes = new Uint8List(payload.payload.length + 1 + 4);
    bytes[0] = 0xFF & payload.version;
    bytes.setRange(1, bytes.length - 4, payload.payload);
    List<int> checksum = sha256(sha256(bytes.sublist(0, bytes.length - 4)));
    bytes.setRange(bytes.length - 4, bytes.length, checksum.getRange(0, 4));
    return new Base58Encoder(alphabet).convert(bytes);
  }
}

class Base58CheckDecoder extends Converter<String, Base58CheckPayload> {

  final String alphabet;
  final Function sha256;

  const Base58CheckDecoder(String this.alphabet, Function this.sha256);

  @override
  Base58CheckPayload convert(String encoded) =>
      _convert(encoded, true);

  Base58CheckPayload convertUnchecked(String encoded) =>
      _convert(encoded, false);

  Base58CheckPayload _convert(String encoded, bool validateChecksum) {
    List<int> bytes = new Base58Decoder(alphabet).convert(encoded);
    if(bytes.length < 5)
      throw new FormatException("Invalid Base58Check encoded string: must be at least size 5");
    List<int> checksum = sha256(sha256(bytes.sublist(0, bytes.length - 4)));
    if(validateChecksum && !new ListEquality().equals(bytes.getRange(bytes.length - 4, bytes.length), checksum.getRange(0, 4))) {
      throw new FormatException("Invalid checksum in Base58Check encoding.");
    }
    return new Base58CheckPayload(bytes[0], bytes.getRange(1, bytes.length - 4));
  }
}