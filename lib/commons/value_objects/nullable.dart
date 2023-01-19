import 'interfaces/value_object.dart';

class Nullable<T> implements ValueObject<T> {
  T _value;

  @override
  T get value => _value;

  Nullable({required T value}) : _value = value;

  @override
  String? validator() => null;

  @override
  void call(T value) {
    _value = value;
  }
}
