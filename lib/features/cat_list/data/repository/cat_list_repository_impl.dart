import 'dart:io';

import 'package:cats_app/core/Network_info/network_info.dart';
import 'package:cats_app/core/error/exception.dart';
import 'package:cats_app/features/cat_list/data/datasources/cat_list_remotedatasource.dart';
import 'package:cats_app/features/cat_list/domain/entities/cat_list_entity.dart';
import 'package:cats_app/core/error/failure.dart';
import 'package:cats_app/features/cat_list/domain/repository/cat_list_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CatListRepoImpl implements CatListRepo {
  final CatListRemoteDataSourceWithDio catListRemoteDataSourceWithDio;
  NetworkInfo networkInfo;
  CatListRepoImpl(
      {required this.catListRemoteDataSourceWithDio,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<CatListEntity>>> fetchCatsList() async {
    if (await networkInfo.isConnected) {
      try {
        final catListFetching =
            await catListRemoteDataSourceWithDio.getCatsList();
        return Right(catListFetching);
      } on ServerException {
        return left(ServerFailure());
      } on SocketException  {
        throw OffLineException();
      }on FormatException {
        return left(FormatFailure());
      }on HttpException{
        return left(HttpFailure());
      }
    } else {
      return left(OffLineFailure());
    }
  }
}
