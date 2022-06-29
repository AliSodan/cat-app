import 'package:cats_app/core/constants/app_colors.dart';
import 'package:cats_app/core/constants/app_images.dart';
import 'package:cats_app/core/global_widgets/custom_button.dart';
import 'package:cats_app/core/global_widgets/custom_padding.dart';
import 'package:cats_app/core/global_widgets/text_widget.dart';
import 'package:cats_app/core/utils/functions/navigators.dart';
import 'package:cats_app/core/utils/responsive_controlers.dart/responsive_controller.dart';
import 'package:cats_app/core/utils/routes/app_routes.dart';
import 'package:cats_app/features/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
       
          TextWidget(
            text: 'Welcome To Our Cats App',
            textColor: Colorful.mainColor,
            textFontSize: 19,
            textFontWeight: FontWeight.w600,
          ), SizedBox(  height: Ratio.h(context)*0.05,),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Image.asset(AppImages.catImage),
          ),
         SizedBox(  height: Ratio.h(context)*0.05,),
          SizedBox(
            height: Ratio.h(context)*0.06,
            child: Consumer(builder: (context, ref, child) {
              return CustomButton(
                onHighLightedChanged: (value) =>
                    ref.read(catListButtonBooleanProvider.notifier).state = value,
                isTapped: ref.watch(catListButtonBooleanProvider),
                onTap: () {
                  Go.to(context, screenName:Routes.catListScreen);
                },
                buttonText: 'Cats List',
              );
            }),
          ),
          SizedBox(
            height: Ratio.h(context) * 0.02,
          ),
          Consumer(builder: (context, ref, child) {
            return SizedBox(
              height: Ratio.h(context)*0.06,
              child: CustomButton(
                onHighLightedChanged: (value) =>
                    ref.read(searchCatsButtonBooleanProvider.notifier).state = value,
                isTapped: ref.watch(searchCatsButtonBooleanProvider),
                onTap: () {
                  Go.to(context, screenName: Routes.searchScreen);
                },
                buttonText: 'Search',
              ),
            );
          }),
          SizedBox(
            height: Ratio.h(context) * 0.02,
          ),
          SizedBox(
            height: Ratio.h(context)*0.06,
            child: Consumer(builder: (context, ref, child) {
              return CustomButton(
                onHighLightedChanged: (value) =>
                    ref.read(gategoryButtonBooleanProvider.notifier).state = value,
                isTapped: ref.watch(gategoryButtonBooleanProvider),
                onTap: () {
                  Go.to(context, screenName: Routes.storeScreen);
                },
                buttonText: 'Store',
              );
            }),
          ),
        ],
      ),
    );
  }
}
