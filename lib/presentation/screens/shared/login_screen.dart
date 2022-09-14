import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/business_logic/login_cubit/login_cubit.dart';
import 'package:testapp/constants/app_strings.dart';
import 'package:testapp/constants/const_validations.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/data/models/user.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/error_snack_bar.dart';
import 'package:testapp/presentation/widget/loading_data_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyThemeData.backGroundColor,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyThemeData.backGroundColor,
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
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    Text(
                      "تسجيل الدخول",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 4.h),
                    // SvgIconViwer(iconPath: AppStrings.egbussSvg),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Image.asset(ConstantData.egbusspng),
                    ),
                    SizedBox(height: 4.h),
                    CustomeTextFeild(
                      textController: phoneNumberController,
                      feildText: "رقم التليفون",
                      withShadow: true,
                      userInputType: TextInputType.number,
                      action: const Icon(Icons.phone_android),
                    ),
                    SizedBox(height: 2.5.h),
                    CustomeTextFeild(
                      textController: passwordController,
                      feildText: "كلمه السر",
                      withShadow: true,
                      userInputType: TextInputType.text,
                      action: const Icon(Icons.password_rounded),
                    ),
                    SizedBox(height: 2.5.h),
                    CustomElevatedButton(
                      buttonColor: MyThemeData.appblue,
                      myWidgets: const DefaultButtonText(text: "تسجيل الدخول"),
                      otpressFunction: () {
                        /**
                         ScaffoldMessenger.of(context)
                            .showSnackBar(ErrorSnackBar(
                                errorText: ConstValidations.loginValidation(
                          phone: phoneNumberController.text,
                          password: passwordController.text,
                        )));
                         */
                        mycubit.loginUser(
                          UserModel(
                            phone: phoneNumberController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    CustomElevatedButton(
                      myWidgets:
                          const DefaultButtonText(text: "تسجيل الدخول كزائر"),
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
