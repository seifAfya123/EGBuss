import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/business_logic/payment_cubit/payment_cubit.dart';
import 'package:testapp/business_logic/payment_cubit/payment_state.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/view/default_app_bar.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/credit_payment_method_widget.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/options_in_profile.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(color: Colors.white),
        backgroundColor: MyThemeData.appblue,
        middle: AppbarTitleText(titleText: 'طرق الدفع'),
      ),
      body: Center(
          child: BodyWhiteContainer(
        withPadding: true,
        bodyChild: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.5.w),
                child: Row(
                  children: [
                    Text('المجموع:'),
                    Text(' 300 جنيه'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.5.w),
                child: Row(
                  children: [
                    Text('1- اختر طريقه الدفع'),
                  ],
                ),
              ),
              BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                builder: (context, state) {
                  if (state is ChangePaymentMethod) {}
                  PaymentMethodCubit mycubit =
                      BlocProvider.of<PaymentMethodCubit>(context);
                  return Column(
                    children: [
                      paymentRow(
                        mycubit.paymentMethod,
                        mycubit,
                      ),
                      mycubit.paymentMethod[0] == PaymentMethod.choosed
                          ? CreditPaymentMethod()
                          : mycubit.paymentMethod[1] == PaymentMethod.choosed
                              ? Container(
                                  child: Text('Fawry'),
                                )
                              : Container(
                                  child: Text('Aman'),
                                )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }

  paymentRow(lista, PaymentMethodCubit myCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionsInProfile(
          icons: Icon(Icons.credit_card),
          text: "بطاقة ائتمان",
          ontap: () => myCubit.reserveSeat(0),
          paymentOptions: lista[0],
        ),
        OptionsInProfile(
          icons: Icon(Icons.credit_card),
          text: "فورى",
          ontap: () => myCubit.reserveSeat(1),
          paymentOptions: lista[1],
        ),
        OptionsInProfile(
          icons: Icon(Icons.credit_card),
          text: "امان",
          ontap: () => myCubit.reserveSeat(2),
          paymentOptions: lista[2],
        ),
      ],
    );
  }
}
