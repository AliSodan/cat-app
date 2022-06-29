import 'package:cats_app/core/error/failure.dart';
import 'package:cats_app/features/cat_list/domain/entities/cat_list_entity.dart';
import 'package:cats_app/features/cat_list/domain/repository/cat_list_repo.dart';
import 'package:dartz/dartz.dart';

class CatListUseCase{
  final CatListRepo catListRepo;
  CatListUseCase({required this.catListRepo });
  Future<Either<Failure,List<CatListEntity>>>call(){
    return catListRepo.fetchCatsList();
  }
}