sealed class Either<L, R> {
  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  L? get leftOrNull => isLeft ? (this as Left<L, R>).error : null;
  R? get rightOrNull => isRight ? (this as Right<L, R>).value : null;

  T fold<T>({
    required T Function(L) left,
    required T Function(R) right,
  }) {
    return switch (this) {
      Left left_ => left(left_.error),
      Right right_ => right(right_.value),
    };
  }
}

class Left<L, R> extends Either<L, R> {
  Left(this.error);
  final L error;
}

class Right<L, R> extends Either<L, R> {
  Right(this.value);
  final R value;
}
