import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List props = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object> get props => const <dynamic>[];
}
