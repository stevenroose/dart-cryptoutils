library cryptoutils.base64;

import "dart:convert";
import "dart:typed_data";

class Base64Codec extends Codec<List<int>, String> {
  final bool urlSafe;
  final bool addLineSeparator;

  const Base64Codec(
      [bool this.urlSafe = false, bool this.addLineSeparator = false]);

  @override
  Converter<List<int>, String> get encoder =>
      new Base64Encoder(urlSafe, addLineSeparator);

  @override
  Converter<String, List<int>> get decoder => new Base64Decoder();
}

/**
 * Converts a list of bytes into a Base 64 encoded string.
 *
 * The list can be any list of integers in the range 0..255,
 * for example a message digest.
 *
 * If [addLineSeparator] is true, the resulting string will  be
 * broken into lines of 76 characters, separated by "\r\n".
 *
 * If [urlSafe] is true, the result is URL and filename safe.
 *
 * Based on [RFC 4648](http://tools.ietf.org/html/rfc4648)
 *
 */
class Base64Encoder extends Converter<List<int>, String> {
  final bool urlSafe;
  final bool addLineSeparator;

  const Base64Encoder(
      [bool this.urlSafe = false, bool this.addLineSeparator = false]);

  static const int _PAD = 61; // '='
  static const int _CR = 13; // '\r'
  static const int _LF = 10; // '\n'
  static const int _BASE64_LINE_LENGTH = 76;
  static const String _encodeTable =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  static const String _encodeTableUrlSafe =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";

  @override
  String convert(List<int> bytes) {
    int len = bytes.length;
    if (len == 0) {
      return "";
    }
    final String lookup = urlSafe ? _encodeTableUrlSafe : _encodeTable;
    // Size of 24 bit chunks.
    final int remainderLength = len.remainder(3);
    final int chunkLength = len - remainderLength;
    // Size of base output.
    int outputLen = ((len ~/ 3) * 4) + ((remainderLength > 0) ? 4 : 0);
    // Add extra for line separators.
    if (addLineSeparator) {
      outputLen += ((outputLen - 1) ~/ _BASE64_LINE_LENGTH) << 1;
    }
    List<int> out = new List<int>(outputLen);

    // Encode 24 bit chunks.
    int j = 0, i = 0, c = 0;
    while (i < chunkLength) {
      int x = ((bytes[i++] << 16) & 0xFFFFFF) |
          ((bytes[i++] << 8) & 0xFFFFFF) |
          bytes[i++];
      out[j++] = lookup.codeUnitAt(x >> 18);
      out[j++] = lookup.codeUnitAt((x >> 12) & 0x3F);
      out[j++] = lookup.codeUnitAt((x >> 6) & 0x3F);
      out[j++] = lookup.codeUnitAt(x & 0x3f);
      // Add optional line separator for each 76 char output.
      if (addLineSeparator && ++c == 19 && j < outputLen - 2) {
        out[j++] = _CR;
        out[j++] = _LF;
        c = 0;
      }
    }

    // If input length if not a multiple of 3, encode remaining bytes and
    // add padding.
    if (remainderLength == 1) {
      int x = bytes[i];
      out[j++] = lookup.codeUnitAt(x >> 2);
      out[j++] = lookup.codeUnitAt((x << 4) & 0x3F);
      out[j++] = _PAD;
      out[j++] = _PAD;
    } else if (remainderLength == 2) {
      int x = bytes[i];
      int y = bytes[i + 1];
      out[j++] = lookup.codeUnitAt(x >> 2);
      out[j++] = lookup.codeUnitAt(((x << 4) | (y >> 4)) & 0x3F);
      out[j++] = lookup.codeUnitAt((y << 2) & 0x3F);
      out[j++] = _PAD;
    }

    return new String.fromCharCodes(out);
  }
}

/**
 * Converts a Base 64 encoded String into list of bytes.
 *
 * Decoder ignores "\r\n" sequences from input.
 *
 * Accepts both URL safe and unsafe Base 64 encoded strings.
 *
 * Throws a [FormatException] exception if input contains invalid characters.
 *
 * Based on [RFC 4648](http://tools.ietf.org/html/rfc4648)
 */
class Base64Decoder extends Converter<String, List<int>> {
  const Base64Decoder();

  // Lookup table used for finding Base 64 alphabet index of a given byte.
  // -2 : Outside Base 64 alphabet.
  // -1 : '\r' or '\n'
  //  0 : = (Padding character).
  // >0 : Base 64 alphabet index of given byte.
  static const List<int> _decodeTable = const [
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -1,
    -2,
    -2,
    -1,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    62,
    -2,
    62,
    -2,
    63,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    -2,
    -2,
    -2,
    0,
    -2,
    -2,
    -2,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    -2,
    -2,
    -2,
    -2,
    63,
    -2,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2,
    -2
  ];
  static const int _PAD = 61; // '='

  @override
  List<int> convert(String input) {
    int len = input.length;
    if (len == 0) {
      return new List<int>(0);
    }

    // Count '\r', '\n' and illegal characters, For illegal characters,
    // throw an exception.
    int extrasLen = 0;
    for (int i = 0; i < len; i++) {
      int c = _decodeTable[input.codeUnitAt(i)];
      if (c < 0) {
        extrasLen++;
        if (c == -2) {
          throw new FormatException('Invalid character: ${input[i]}');
        }
      }
    }

    if ((len - extrasLen) % 4 != 0) {
      throw new FormatException('''Size of Base 64 characters in Input
          must be a multiple of 4. Input: $input''');
    }

    // Count pad characters.
    int padLength = 0;
    for (int i = len - 1; i >= 0; i--) {
      int currentCodeUnit = input.codeUnitAt(i);
      if (_decodeTable[currentCodeUnit] > 0) break;
      if (currentCodeUnit == _PAD) padLength++;
    }
    int outputLen = (((len - extrasLen) * 6) >> 3) - padLength;
    List<int> out = new Uint8List(outputLen);

    for (int i = 0, o = 0; o < outputLen;) {
      // Accumulate 4 valid 6 bit Base 64 characters into an int.
      int x = 0;
      for (int j = 4; j > 0;) {
        int c = _decodeTable[input.codeUnitAt(i++)];
        if (c >= 0) {
          x = ((x << 6) & 0xFFFFFF) | c;
          j--;
        }
      }
      out[o++] = x >> 16;
      if (o < outputLen) {
        out[o++] = (x >> 8) & 0xFF;
        if (o < outputLen) out[o++] = x & 0xFF;
      }
    }
    return out;
  }

  /**
   * number -> number / 256
   * returns number % 256
   */
  static int _divmod256(List<int> number58, int startAt) {
    int remaining = 0;
    for (int i = startAt; i < number58.length; i++) {
      int num = 58 * remaining + (number58[i] & 0xFF);
      number58[i] = num ~/ 256;
      remaining = num % 256;
    }
    return remaining;
  }
}
