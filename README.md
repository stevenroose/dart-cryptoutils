[![Build Status](https://drone.io/github.com/stevenroose/dart-cryptoutils/status.png)](https://drone.io/github.com/stevenroose/dart-cryptoutils/latest)

A small utility library for crypto. It declares a class names `CryptoUtils` which can replace the one in `package:crypto`. It includes the few methods this class provides.

I created this library because I had a bunch of crypto-related utility functions that I used across different projects and wanted to avoid code duplication.

If you have other crypto-related code you don't want to duplicate, feel free to include it and file a PR.

Currently it includes:
 - all the methods `CryptoUtils` from `package:crypto`
 - a Codec (including separate encoder and decoder classes) for the following encidings:
   - base65
   - base58
   - [Base58Check](https://en.bitcoin.it/wiki/Base58Check_encoding)
 - an abstract class `Hash` and several fixed-sized hash classes, `Hash128`, `Hash160`, `Hash256`, `Hash512`
