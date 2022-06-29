import 'package:cats_app/core/Network_info/network_info.dart';
import 'package:cats_app/core/utils/routes/app_routes.dart';
import 'package:cats_app/features/cat_list/data/datasources/cat_list_remotedatasource.dart';
import 'package:cats_app/features/cat_list/data/repository/cat_list_repository_impl.dart';
import 'package:cats_app/features/cat_list/domain/use_cases/fetch_cats_use_case.dart';
import 'package:cats_app/features/cat_list/presentaion/business_logic/bloc/catlistbloc/cat_list_bloc.dart';
import 'package:cats_app/features/cat_list/presentaion/pages/cat_list_screen.dart';
import 'package:cats_app/features/search/presentation/pages/search_screen.dart';
import 'package:cats_app/features/store/presentation/pages/store.dart';
import 'package:cats_app/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../features/main_screen/main_screen.dart';

class AppRouter {
  static Route? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.catListScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CatListBloc(catListUseCase: CatListUseCase(catListRepo: CatListRepoImpl(catListRemoteDataSourceWithDio: CatListRemoteDataSourceWithDio(),networkInfo: NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()))))..add(GetAllCatsEvent()),//sl<CatListBloc>.call(instanceName: 'CatListBloc')..add(GetAllCatsEvent()),
            child:const CatListScreen(),
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (context) =>BlocProvider(
            create: (context) => CatListBloc(catListUseCase: CatListUseCase(catListRepo: CatListRepoImpl(catListRemoteDataSourceWithDio: CatListRemoteDataSourceWithDio(),networkInfo: NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()))))..add(GetAllCatsEvent()),//sl<CatListBloc>.call(instanceName: 'CatListBloc')..add(GetAllCatsEvent()),
            child:const SearchScreen(),
          ),);
      case Routes.storeScreen:
        return MaterialPageRoute(builder: (context) =>  StoreScreen());
    }
  }
}
