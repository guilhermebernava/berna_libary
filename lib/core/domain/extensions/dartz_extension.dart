import 'package:dartz/dartz.dart';

extension EitherExtension<L, R> on Either<L, R> {
  R right() => (this as Right).value;
  L left() => (this as Left).value;
}
