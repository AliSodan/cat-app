import 'dart:io';

import 'package:cats_app/core/constants/urls.dart';
import 'package:cats_app/core/error/exception.dart';
import 'package:cats_app/features/cat_list/data/models/cat_list_model.dart';
import 'package:dio/dio.dart';



class CatListRemoteDataSourceWithDio  {
  //@override
  Future<List<CatListModel>> getCatsList() async {
    Dio dio = Dio();

    final Response response = await dio.get(
      catListUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'Eb26cf43-512b-4e2b-9685-e3b47963ef4b',
        },
      ),
    );
    if (response.statusCode == 200) {
      List<CatListModel> catList = response.data
          .map<CatListModel>(
            (cat) => CatListModel.fromJson(cat),
          )
          .toList();
          print(catList );
      return catList;
    }else if(response.statusCode==403){
    throw HttpException('http exception');
    } else {
      throw ServerException();
    }
  }
}
