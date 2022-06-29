import 'package:cats_app/features/cat_list/data/models/cat_list_model.dart';
import 'package:cats_app/features/cat_list/domain/entities/weightt_entity.dart';
import 'package:equatable/equatable.dart';




class CatListEntity extends Equatable{
  final WeightEntity weightEntity;
 final String id;
  final String name;
    final String origin;
    final String description;
    final String wikipedia_url;
    final Image image;
  CatListEntity({required this.description,required this.id,required this.image,required this.name,required this.origin,required this.wikipedia_url,required this.weightEntity});
  @override
  List<Object?> get props =>[description,id,image,name,origin,wikipedia_url,weightEntity];

}