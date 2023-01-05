// ignore_for_file: unused_field, prefer_final_fields
abstract class ValueObject<T> {
  T _value;

  ValueObject({required T value}) : _value = value;

  T get value => _value;

  String? validator();
  void call(T value);
}
