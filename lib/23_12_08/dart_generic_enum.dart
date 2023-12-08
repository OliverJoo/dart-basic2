class StrongBox {
  Object? _data;

  void put(Object data) => _data = data;

  Object? get() => _data;
}
