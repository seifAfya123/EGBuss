import 'package:flutter/material.dart';
import 'package:testapp/business_logic/login_cubit/login_cubit.dart';
import 'package:testapp/data/models/user.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/widget/custom_cicular_image.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/loading_data_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("تسجيل الدخول"),
        ),
        // backgroundColor: Colors.red,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is SuccessState) {
              Navigator.pushReplacementNamed(
                  context, RoutNamesDart.rHomeScreen);
            }
          },
          builder: (context, state) {
            LoginCubit mycubit = BlocProvider.of<LoginCubit>(context);
            if (state is LoadingState) {
              return const LoadingDataWidget();
            }
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    CustomCicularImage(
                      imgRadius: 50.w,
                    ),
                    SizedBox(height: 10.h),
                    CustomeTextFeild(
                      textController: phoneNumberController,
                      feildText: "رقم التليفون",
                      withShadow: true,
                      userInputType: TextInputType.number,
                      action: const Icon(Icons.phone_android),
                    ),
                    SizedBox(height: 3.h),
                    CustomeTextFeild(
                      textController: passwordController,
                      feildText: "كلمه السر",
                      withShadow: true,
                      userInputType: TextInputType.number,
                      action: const Icon(Icons.password_rounded),
                    ),
                    SizedBox(height: 3.h),
                    CustomElevatedButton(
                      myWidgets: const DefaultButtonText(text: "تسجيل الدخول"),
                      otpressFunction: () {
                        mycubit.loginUser(
                          UserModel(
                            phone: phoneNumberController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutNamesDart.rRegisterScreen);
                      },
                      child: Text("انشاء حساب جديد"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
