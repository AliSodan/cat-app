import 'package:bloc/bloc.dart';
import 'package:cats_app/core/error/failure.dart';
import 'package:cats_app/features/cat_list/domain/entities/cat_list_entity.dart';
import 'package:cats_app/features/cat_list/domain/use_cases/fetch_cats_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cat_list_event.dart';
part 'cat_list_state.dart';

class CatListBloc extends Bloc<CatListEvent, CatListState> {
  CatListUseCase catListUseCase;
  List <CatListEntity>cats=[];
  CatListBloc({required this.catListUseCase}) : super(CatListInitial()) {
    on<CatListEvent>((event, emit) async {
      if (event is GetAllCatsEvent) {
        emit(LoadingCatsListState());
        final catListOrError = await catListUseCase.call();
        catListOrError.fold(
          (failure) {
            emit(
              ErrorCatsListState(
                errorMessage: failureType(failure),
              ),
            );
          },
          (catList) {
          
            emit(
              LoadedCatsListState(
                catList: catList,
              ),
            );
          },
        );
      }
    });
  }
  String failureType(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure, please try again later.';
      case OffLineFailure:
        return 'Error, please check your Internet connection.';

      default:
        return 'Unexpected Error, please try again later.';
    }
  }
}
