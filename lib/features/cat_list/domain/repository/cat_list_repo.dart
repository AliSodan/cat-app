import 'package:cats_app/core/error/failure.dart';
import 'package:cats_app/features/cat_list/domain/entities/cat_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatListRepo{
Future <Either<Failure,List<CatListEntity>>>fetchCatsList();
}