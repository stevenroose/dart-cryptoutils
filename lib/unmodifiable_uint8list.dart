library cryptoutils.unmodifiable_uint8list;

import "dart:typed_data";

import "package:zengen/zengen.dart";

part "src/unmodifiable_uint8list.g.dart";


/**
 * A wrapper class to make an unmodifiable [Uint8List].
 *
 * All methods that can modify the list will throw an [UnsupportedError].
 */
class _UnmodifiableUint8List {

  @Delegate()
  final Uint8List _underlyingUint8List;

  /**
   * Create a new unmodifiable wrapper around a [Uint8List].
   */
  _UnmodifiableUint8List(Uint8List this._underlyingUint8List);

  /**
   * Instead of just wrapping the object, this factory constructor first
   * makes a full copy of the [Uint8List].
   */
  _UnmodifiableUint8List.fromList(List<int> uint8listToCopy) :
      this(new Uint8List.fromList(uint8listToCopy));

  /** This operation is not supported by an unmodifiable list. */
  @override
  void operator []=(int index, int value) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void set length(int newLength) {
    throw new UnsupportedError(
        "Cannot change the length of an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void setAll(int at, Iterable<int> iterable) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void add(int value) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  int insert(int index, int value) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void insertAll(int at, Iterable<int> iterable) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void addAll(Iterable<int> iterable) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  bool remove(Object element) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void removeWhere(bool test(int element)) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void retainWhere(bool test(int element)) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void sort([Comparator<int> compare]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void shuffle([var random]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void clear() {
    throw new UnsupportedError(
        "Cannot clear an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  int removeAt(int index) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  int removeLast() {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void setRange(int start, int end, Iterable<int> iterable, [int skipCount = 0]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void removeRange(int start, int end) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void replaceRange(int start, int end, Iterable<int> iterable) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void fillRange(int start, int end, [int fillValue]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }
}
