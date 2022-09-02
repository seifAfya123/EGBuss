import 'package:flutter/material.dart';
import 'package:testapp/business_logic/register_cubit/register_cubit.dart';
import 'package:testapp/data/models/user.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("تسجيل الدخول"),
        ),
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
                    SizedBox(height: 10.h),
                    CustomeTextFeild(
                      textController: nameController,
                      feildText: "الاسم",
                      withShadow: true,
                      userInputType: TextInputType.name,
                      action: const Icon(Icons.person),
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
}
