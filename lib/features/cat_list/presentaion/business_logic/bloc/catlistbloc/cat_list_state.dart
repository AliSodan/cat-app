part of 'cat_list_bloc.dart';

abstract class CatListState extends Equatable {
  const CatListState();
  
  @override
  List<Object> get props => [];
}

class CatListInitial extends CatListState {}

class LoadingCatsListState extends CatListState{}

class LoadedCatsListState extends CatListState{
  List<CatListEntity>catList;
  LoadedCatsListState({required this.catList  });
  @override

  List<Object> get props => [catList];
}

class ErrorCatsListState extends CatListState{
  final String errorMessage;
  ErrorCatsListState({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}