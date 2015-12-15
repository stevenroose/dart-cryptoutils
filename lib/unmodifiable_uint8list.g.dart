// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-15T14:35:51.190Z

part of cryptoutils.unmodifiable_uint8list;

// **************************************************************************
// Generator: ZengenGenerator
// Target: library cryptoutils.unmodifiable_uint8list
// **************************************************************************

@GeneratedFrom(_UnmodifiableUint8List)
/**
 * A wrapper class to make an unmodifiable [Uint8List].
 *
 * All methods that can modify the list will throw an [UnsupportedError].
 */
class UnmodifiableUint8List implements Uint8List {
  final Uint8List _underlyingUint8List;

  /**
   * Create a new unmodifiable wrapper around a [Uint8List].
   */
  UnmodifiableUint8List(Uint8List this._underlyingUint8List);

  /**
   * Instead of just wrapping the object, this factory constructor first
   * makes a full copy of the [Uint8List].
   */
  UnmodifiableUint8List.fromList(List<int> uint8listToCopy)
      : this(new Uint8List.fromList(uint8listToCopy));

  /** This operation is not supported by an unmodifiable list. */
  @override
  void operator []=(int index, int value) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
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
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void add(int value) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  int insert(int index, int value) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void insertAll(int at, Iterable<int> iterable) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void addAll(Iterable<int> iterable) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  bool remove(Object element) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void removeWhere(bool test(int element)) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void retainWhere(bool test(int element)) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void sort([Comparator<int> compare]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void shuffle([var random]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void clear() {
    throw new UnsupportedError("Cannot clear an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  int removeAt(int index) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  int removeLast() {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void setRange(int start, int end, Iterable<int> iterable,
      [int skipCount = 0]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void removeRange(int start, int end) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void replaceRange(int start, int end, Iterable<int> iterable) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  @override
  void fillRange(int start, int end, [int fillValue]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  ByteBuffer get buffer => _underlyingUint8List.buffer;
  int get lengthInBytes => _underlyingUint8List.lengthInBytes;
  int get offsetInBytes => _underlyingUint8List.offsetInBytes;
  int get elementSizeInBytes => _underlyingUint8List.elementSizeInBytes;
  int elementAt(int index) => _underlyingUint8List.elementAt(index);
  int singleWhere(bool test(int element)) =>
      _underlyingUint8List.singleWhere(test);
  int lastWhere(bool test(int element), {int orElse()}) =>
      _underlyingUint8List.lastWhere(test, orElse: orElse);
  int firstWhere(bool test(int element), {int orElse()}) =>
      _underlyingUint8List.firstWhere(test, orElse: orElse);
  Iterable<int> skipWhile(bool test(int value)) =>
      _underlyingUint8List.skipWhile(test);
  Iterable<int> skip(int count) => _underlyingUint8List.skip(count);
  Iterable<int> takeWhile(bool test(int value)) =>
      _underlyingUint8List.takeWhile(test);
  Iterable<int> take(int count) => _underlyingUint8List.take(count);
  Set<int> toSet() => _underlyingUint8List.toSet();
  List<int> toList({bool growable: true}) =>
      _underlyingUint8List.toList(growable: growable);
  bool any(bool f(int element)) => _underlyingUint8List.any(f);
  String join([String separator = ""]) => _underlyingUint8List.join(separator);
  bool every(bool f(int element)) => _underlyingUint8List.every(f);
  dynamic fold(dynamic initialValue,
          dynamic combine(dynamic previousValue, int element)) =>
      _underlyingUint8List.fold(initialValue, combine);
  int reduce(int combine(int value, int element)) =>
      _underlyingUint8List.reduce(combine);
  void forEach(void f(int element)) {
    _underlyingUint8List.forEach(f);
  }

  bool contains(Object element) => _underlyingUint8List.contains(element);
  Iterable expand(Iterable f(int element)) => _underlyingUint8List.expand(f);
  Iterable<int> where(bool f(int element)) => _underlyingUint8List.where(f);
  Iterable map(dynamic f(int element)) => _underlyingUint8List.map(f);
  int get single => _underlyingUint8List.single;
  int get last => _underlyingUint8List.last;
  int get first => _underlyingUint8List.first;
  bool get isNotEmpty => _underlyingUint8List.isNotEmpty;
  bool get isEmpty => _underlyingUint8List.isEmpty;
  Iterator<int> get iterator => _underlyingUint8List.iterator;
  Map<int, int> asMap() => _underlyingUint8List.asMap();
  Iterable<int> getRange(int start, int end) =>
      _underlyingUint8List.getRange(start, end);
  List<int> sublist(int start, [int end]) =>
      _underlyingUint8List.sublist(start, end);
  int lastIndexOf(int element, [int start]) =>
      _underlyingUint8List.lastIndexOf(element, start);
  int indexOf(int element, [int start = 0]) =>
      _underlyingUint8List.indexOf(element, start);
  int operator [](int index) => _underlyingUint8List[index];
  Iterable<int> get reversed => _underlyingUint8List.reversed;
  int get length => _underlyingUint8List.length;
  int get BYTES_PER_ELEMENT => _underlyingUint8List.BYTES_PER_ELEMENT;
}
