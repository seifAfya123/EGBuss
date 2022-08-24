import 'package:flutter/material.dart';
import 'package:testapp/business_logic/global_cubit/global_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/widget/custom_image_container.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => GlobalCubit()
        ..navigate(
          afterSuccess: () {
            Navigator.pushReplacementNamed(
              context,
              RoutNamesDart.rLoginScreen,
            );
          },
        ),
      child: Scaffold(
        body: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
              child: CustomImageContainer(
                imagePath: null,
                withShadow: false,
                widthAndHeight: 70.w,
              ),
            );
          },
        ),
      ),
    ));
  }
}
