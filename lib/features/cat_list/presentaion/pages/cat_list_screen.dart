

import 'package:cats_app/core/constants/app_colors.dart';
import 'package:cats_app/core/global_widgets/text_widget.dart';
import 'package:cats_app/core/utils/responsive_controlers.dart/responsive_controller.dart';
import 'package:cats_app/features/cat_list/presentaion/business_logic/bloc/catlistbloc/cat_list_bloc.dart';
import 'package:cats_app/features/cat_list/presentaion/widgets/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CatListScreen extends StatelessWidget {
  const CatListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:_buildScreenContent() ,
    );
  }
  AppBar _buildAppBar(){
    return AppBar(
        backgroundColor: Colorful.mainColor,
        title:const TextWidget(
          text: 'Cats',
          textColor: Colors.white,
          textFontSize: 20,
          textFontWeight: FontWeight.w700,
          ),
      );
  }
  Widget _buildScreenContent(){
    return Padding(
      padding:const EdgeInsets.all(10),
       child: BlocBuilder<CatListBloc, CatListState>(
         builder: (context, state) {
          if(state is LoadingCatsListState){
            return Center(
              child: CircularProgressIndicator(color: Colorful.mainColor,),
            );
            
          }else if(state is LoadedCatsListState){
            return SizedBox(
/*               height: Ratio.h(context)*0.04,
              width: Ratio.w(context)*0.3, */
              child:   ListView.builder(
                shrinkWrap: true,
                itemCount: state.catList.length,
                itemBuilder: (context,i){
                  return CatCard(
                    wikiUrl: state.catList[i].wikipedia_url,
                    origin: state.catList[i].origin,
                    id:state.catList[i].id ,
                    imperial: state.catList[i].weightEntity.imperial,
                    imgUrl: state.catList[i].image.url,
                     cardContent: state.catList[i].name,
                     description: state.catList[i].description,
                     ); 
                }) ,
            );
          }else if(state is ErrorCatsListState){
            return Center(
              child: TextWidget(text:state.errorMessage,textColor: Colors.red,textFontSize: 20,textFontWeight: FontWeight.w600,),
            );
          }else{
            return Text('UnExpected Error');
          }
          }
       ),
    );
  }
}