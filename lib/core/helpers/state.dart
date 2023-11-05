class MyState<T> {
  MyState();
  factory MyState.loading() => StateLoading();
  factory MyState.failed(dynamic e) => StateError(e);
  factory MyState.success(T data) => StateSuccess(data);
}

class StateSuccess<T> extends MyState<T> {
  final T data;
  StateSuccess(this.data);
}

class StateError<T> extends MyState<T> {
  final dynamic error;
  StateError(this.error);
}

class StateLoading<T> extends MyState<T> {}
