import 'package:berna_libary/core/value_objects/interfaces/value_object.dart';

class NotNull<T> implements ValueObject<T> {
  T _value;

  @override
  T get value => _value;

  NotNull({required T value}) : _value = value;

  @override
  String? validator() {
    if (_value == null || _value.toString() == "") {
      return "value could not be null";
    }

    return null;
  }

  @override
  void call(T value) {
    _value = value;
  }
}
