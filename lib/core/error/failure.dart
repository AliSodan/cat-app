
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OffLineFailure extends Failure{
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}
class FormatFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class HttpFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}