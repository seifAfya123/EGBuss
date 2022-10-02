import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/business_logic/global_cubit/global_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_image_container.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit()
        ..navigate(
          afterSuccess: () {
            Navigator.pushReplacementNamed(
              context,
              RoutNamesDart.rLoginScreen,
              // send data from here
            );
          },
        ),
      child: Scaffold(
        backgroundColor: MyThemeData.backGroundColor,
        body: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                ConstantData.newSplashScreen,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }
}
