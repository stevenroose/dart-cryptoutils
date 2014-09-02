library cryptoutils.test.base58;

import "package:unittest/unittest.dart";
import "package:cryptoutils/cryptoutils.dart";


const String _bitcoinAlphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
List<List<String>> _bitcoinVectors = [
    ["", ""],
    ["61", "2g"],
    ["626262", "a3gV"],
    ["636363", "aPEr"],
    ["73696d706c792061206c6f6e6720737472696e67", "2cFupjhnEsSn59qHXstmK2ffpLv2"],
    ["00eb15231dfceb60925886b67d065299925915aeb172c06647", "1NS17iag9jJgTHD1VXjvLCEnZuQ3rJDE9L"],
    ["516b6fcd0f", "ABnLTmg"],
    ["bf4f89001e670274dd", "3SEo3LWLoPntC"],
    ["572e4794", "3EFU7m"],
    ["ecac89cad93923c02321", "EJDM8drfXA6uyA"],
    ["10c8511e", "Rt5zm"],
    ["00000000000000000000", "1111111111"]
];


void _testVectors() {
  Base58Codec codec = const Base58Codec(_bitcoinAlphabet);
  for(List<String> vector in _bitcoinVectors) {
    List<int> bytes = CryptoUtils.hexToBytes(vector[0]);
    String encoding = vector[1];
    expect(codec.encode(bytes), equals(encoding), reason: "encode " + vector.toString());
    expect(codec.decode(encoding), equals(bytes), reason: "decode " + vector.toString());
  }
}


void main() {
  test("base58_bitcoin_vectors", () => _testVectors());
}