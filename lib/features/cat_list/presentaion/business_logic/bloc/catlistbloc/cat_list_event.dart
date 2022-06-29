part of 'cat_list_bloc.dart';

abstract class CatListEvent extends Equatable {
  const CatListEvent();

  @override
  List<Object> get props => [];
}

class GetAllCatsEvent extends CatListEvent{}