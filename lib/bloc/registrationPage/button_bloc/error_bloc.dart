import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:resumemaker/utils/failure.dart';


class ErrorBloc extends AnyAnimatedButtonBloc<int, String, Failure> {
  @override
  Future<Either<Failure, String>> asyncAction(int input) {
    return Future.delayed(
      const Duration(milliseconds: 2000),
      () => Left(DefaultFailure()),
    );
  }
}