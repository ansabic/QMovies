abstract class Result<T, F> {
  T? _value;
  F? _error;

  T? get value => _value;

  F? get error => _error;

  Result.value(this._value);

  Result.error(this._error);

  bool isOfType<U>() => _error != null && _error is U || _value != null && _value is U;
}

class Value<T, F> extends Result<T, F> {
  Value(T value) : super.value(value);
}

class Loading<T, F> extends Result<T, F> {
  Loading(T value) : super.value(value);
}

class Error<T, F> extends Result<T, F> {
  Error(F error) : super.error(error);
}
