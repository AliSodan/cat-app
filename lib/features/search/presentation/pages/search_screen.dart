import 'package:cats_app/core/constants/app_colors.dart';
import 'package:cats_app/core/global_widgets/text_widget.dart';
import 'package:cats_app/core/utils/responsive_controlers.dart/responsive_controller.dart';
import 'package:cats_app/features/cat_list/domain/entities/cat_list_entity.dart';
import 'package:cats_app/features/cat_list/presentaion/business_logic/bloc/catlistbloc/cat_list_bloc.dart';
import 'package:cats_app/features/cat_list/presentaion/widgets/cat_card.dart';
import 'package:cats_app/features/search/presentation/business_logic/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [SizedBox(
            height: Ratio.h(context) * 0.3,
            width: Ratio.w(context)*0.5,
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(
                left: Ratio.w(context) * 0.04,
                right: Ratio.w(context) * 0.04,
              ),
              child: Consumer(builder: (context, ref, child) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                  onChanged: (value) {
                    ref.read(searchValueProvider.notifier).state = value;
                    print(ref.watch(searchValueProvider));
                  },
                );
              }),
            )),
          ),],
        backgroundColor: Colorful.mainColor,
        title: const TextWidget(
          text: 'Search',
          textColor: Colors.white,
          textFontSize: 18,
          textFontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: Ratio.h(context) * 1,
      width: Ratio.w(context) * 1,
      child: Column(
        children: [
          SizedBox(
            height: Ratio.h(context) ,
            width: Ratio.w(context),
            child: BlocBuilder<CatListBloc, CatListState>(
              builder: (context, state) {
                if (state is LoadingCatsListState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedCatsListState) {
                  return Consumer(builder: (context, ref, child) {
                   
                    BlocProvider.of<CatListBloc>(context).cats = state.catList
                        .where((element) => element.name
                            .toLowerCase()
                            .startsWith(ref.watch(searchValueProvider).toLowerCase()))
                        .toList(); if (ref.watch(searchValueProvider) == '') {
                      print('im throght this  ');
                      BlocProvider.of<CatListBloc>(context).cats = [];
                    }
                    print('+++++++++++++++++++++++++++++++++++++++++++');
                    print(BlocProvider.of<CatListBloc>(context).cats);
                    return ref.watch(searchValueProvider)!=''?ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children:
                          BlocProvider.of<CatListBloc>(context).cats.map((e) {
                        return SizedBox(
                          width: Ratio.w(context)*0.4,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CatCard(
                              wikiUrl: e.wikipedia_url,
                              origin: e.origin,
                              id: e.id,
                              imperial: e.weightEntity.imperial,
                              imgUrl: e.image.url,
                              cardContent: e.name,
                              description: e.description,
                            ),
                          ),
                        );
                      }).toList(),
                    ):Center(child: TextWidget(text: 'Search for a cat',textColor: Colorful.darkPrime,textFontSize: 20,textFontWeight: FontWeight.w600,),);
                  });
                } else if (state is ErrorCatsListState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else {
                  return Text('ERRRRRRORRRR');
                }
              },
            ),
          ),
          /* SizedBox(
            height: Ratio.h(context) * 0.3,
            width: Ratio.w(context),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(
                left: Ratio.w(context) * 0.04,
                right: Ratio.w(context) * 0.04,
              ),
              child: Consumer(builder: (context, ref, child) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                  ),
                  onChanged: (value) {
                    ref.read(searchValueProvider.notifier).state = value;
                    print(ref.watch(searchValueProvider));
                  },
                );
              }),
            )),
          ), */
        ],
      ),
    );
  }
}/*  state.catList.map((e) {
                         return e.name.startsWith(ref.watch(searchValueProvider))?Text(e.name):Container();
                       }).toList(), */