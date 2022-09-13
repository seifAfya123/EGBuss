import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/business_logic/payment_cubit/payment_cubit.dart';
import 'package:testapp/business_logic/payment_cubit/payment_state.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/view/default_app_bar.dart';
import 'package:testapp/presentation/widget/credit_payment_method_widget.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/options_in_profile.dart';
import 'package:testapp/presentation/widget/payment_opyions.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('طرق الدفع')),
      ),
      body: Center(
          child: BodyWhiteContainer(
        bodyChild: Column(
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
                return paymentRow(
                  mycubit.paymentMethod,
                  mycubit,
                );
              },
            ),
          ],
        ),
      )),
    );
  }

  paymentRow(lista, PaymentMethodCubit myCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PaymentOptions(
            icons: const Icon(Icons.abc),
            text: 'امان',
            fun: () => myCubit.reserveSeat(0),
            paymentOptions: lista[2]),
        PaymentOptions(
            icons: const Icon(Icons.abc),
            text: 'فوري',
            fun: () => myCubit.reserveSeat(1),
            paymentOptions: lista[1]),
        PaymentOptions(
            icons: const Icon(Icons.credit_card),
            text: 'بطاقة ائتمان',
            fun: () => myCubit.reserveSeat(2),
            paymentOptions: lista[0]),
      ],
    );
  }
}
