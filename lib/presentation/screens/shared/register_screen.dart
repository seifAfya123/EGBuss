import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/business_logic/register_cubit/register_cubit.dart';
import 'package:testapp/constants/const_validations.dart';
import 'package:testapp/data/models/user.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testapp/presentation/widget/loading_data_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyThemeData.backGroundColor,
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyThemeData.backGroundColor,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is SuccessState) {
              Navigator.pushReplacementNamed(
                  context, RoutNamesDart.rHomeScreen);
            }
          },
          builder: (context, state) {
            RegisterCubit mycubit = BlocProvider.of<RegisterCubit>(context);
            if (state is LoadingState) {
              return const LoadingDataWidget();
            }
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Text(
                      "انشاء حساب",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 5.h),
                    CustomeTextFeild(
                      textController: nameController,
                      feildText: "الاسم",
                      withShadow: true,
                      userInputType: TextInputType.name,
                      action: const Icon(Icons.person),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          child: CustomElevatedButton(
                              buttonColor: MyThemeData.appGery,
                              myWidgets: Text("Male"),
                              otpressFunction: () {}),
                        ),
                        Container(
                          width: 40.w,
                          child: CustomElevatedButton(
                              myWidgets: Text("female"),
                              otpressFunction: () {}),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    CustomeTextFeild(
                        textController: phoneNumberController,
                        feildText: "رقم التليفون",
                        withShadow: true,
                        userInputType: TextInputType.number,
                        action: const Icon(Icons.phone_android_outlined)),
                    SizedBox(height: 3.h),
                    CustomeTextFeild(
                      textController: passwordController,
                      feildText: "كلمه السر",
                      withShadow: true,
                      userInputType: TextInputType.number,
                      action: const Icon(Icons.password_rounded),
                    ),
                    SizedBox(height: 3.h),
                    CustomeTextFeild(
                      textController: passwordController,
                      feildText: "تاكيد كلمه السر",
                      withShadow: true,
                      userInputType: TextInputType.number,
                      action: const Icon(Icons.password_rounded),
                    ),
                    SizedBox(height: 3.h),
                    CustomeTextFeild(
                      textController: emailController,
                      feildText: "البريد الالكتروني",
                      withShadow: true,
                      userInputType: TextInputType.emailAddress,
                      action: const Icon(Icons.email),
                    ),
                    SizedBox(height: 3.h),
                    CustomElevatedButton(
                      buttonColor: MyThemeData.appblue,
                      myWidgets: const DefaultButtonText(text: "انشاء حساب"),
                      otpressFunction: () {
                        mycubit.registerUser(
                          UserModel(
                            name: nameController.text,
                            password: passwordController.text,
                            cPassword: cpasswordController.text,
                            phone: phoneNumberController.text,
                            email: emailController.text,
                          ),
                        );
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RoutNamesDart.rLoginScreen);
                        },
                        child: Text("لديك حساب بالفعل"))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  snackbarWidget(String text) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 1500),
    );
  }

  gotoOTPSCreen(RegisterCubit mycubit, BuildContext context) {
    var x = ConstValidations.validateAllFeilds(
      controllersList: [
        nameController.text,
        emailController.text,
        phoneNumberController.text,
        passwordController.text,
        cpasswordController.text
      ],
    );
    if (x == null) {
      mycubit.registerUser(
        UserModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          password: passwordController.text,
          cPassword: cpasswordController.text,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackbarWidget(x ?? "error"));
    }
  }
}
