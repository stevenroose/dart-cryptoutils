part of cryptoutils;


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
  factory UnmodifiableUint8List.fromList(List<int> uint8listToCopy) =>
      new UnmodifiableUint8List(new Uint8List.fromList(uint8listToCopy));

  @override
  noSuchMethod(Invocation invocation) => reflect(_underlyingUint8List).delegate(invocation);

  /** This operation is not supported by an unmodifiable list. */
  void operator []=(int index, E value) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void set length(int newLength) {
    throw new UnsupportedError(
        "Cannot change the length of an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void setAll(int at, Iterable<E> iterable) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void add(E value) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  E insert(int index, E value) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void insertAll(int at, Iterable<E> iterable) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void addAll(Iterable<E> iterable) {
    throw new UnsupportedError(
        "Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  bool remove(Object element) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void removeWhere(bool test(E element)) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void retainWhere(bool test(E element)) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void sort([Comparator<E> compare]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void shuffle([Random random]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void clear() {
    throw new UnsupportedError(
        "Cannot clear an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  E removeAt(int index) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  E removeLast() {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void removeRange(int start, int end) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void replaceRange(int start, int end, Iterable<E> iterable) {
    throw new UnsupportedError(
        "Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void fillRange(int start, int end, [E fillValue]) {
    throw new UnsupportedError(
        "Cannot modify an unmodifiable list");
  }
}
