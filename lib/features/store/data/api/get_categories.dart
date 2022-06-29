import 'package:cats_app/core/error/exception.dart';
import 'package:cats_app/features/store/data/model/category_model.dart';
import 'package:dio/dio.dart';

class GetCategories{
  Dio dio=Dio();
  Future<List<CategoryModel>> call()async{
    Response response =await dio.get('https://api.thecatapi.com/v1/categories');
  if(response.statusCode==200){
   List <CategoryModel>categories=response.data.map<CategoryModel>((category)=>CategoryModel.fromJson(category)).toList();
    print(categories [0].id);
    return categories;
  }else{
    throw ServerException();
  }
  }
}