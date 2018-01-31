library cryptoutils.utils;

import "dart:typed_data";

import "package:cryptoutils/encoding/base64.dart";

abstract class CryptoUtils {
  /****************
   * HEX ENCODING *
   ****************/

  static const String _BYTE_ALPHABET = "0123456789abcdef";

  /**
   * Convert a list of bytes (for example a message digest) into a hex
   * string.
   */
  static String bytesToHex(List<int> bytes) {
    var result = new StringBuffer();
    for (var part in bytes) {
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }

  /**
   * Convert a hexadecimal string to a list of bytes.
   */
  static Uint8List hexToBytes(String hex) {
    hex = hex.replaceAll(" ", "");
    hex = hex.toLowerCase();
    if (hex.length % 2 != 0) hex = "0" + hex;
    Uint8List result = new Uint8List(hex.length ~/ 2);
    for (int i = 0; i < result.length; i++) {
      int value = (_BYTE_ALPHABET.indexOf(hex[i * 2]) << 4) //= byte[0] * 16
          +
          _BYTE_ALPHABET.indexOf(hex[i * 2 + 1]);
      result[i] = value;
    }
    return result;
  }

  /********************
   * BASE 64 ENCODING *
   ********************/

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
  static String bytesToBase64(List<int> bytes,
          [bool urlSafe = false, bool addLineSeparator = false]) =>
      new Base64Encoder(urlSafe, addLineSeparator).convert(bytes);

  /**
   * Converts a Base 64 encoded String into list of bytes.
   *
   * Decoder ignores "\r\n" sequences from input.
   *
   * Accepts both URL safe and unsafe Base 64 encoded strings.
   *
   * Throws a FormatException exception if input contains invalid characters.
   *
   * Based on [RFC 4648](http://tools.ietf.org/html/rfc4648)
   */
  static Uint8List base64StringToBytes(String input) =>
      new Base64Decoder().convert(input);
}
