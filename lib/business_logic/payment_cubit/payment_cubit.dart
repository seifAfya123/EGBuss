import 'package:bloc/bloc.dart';
import 'package:testapp/constants/constant_data.dart';

import 'payment_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodInitial());
  List<PaymentMethod> paymentMethod = [
    PaymentMethod.choosed,
    PaymentMethod.notChoosed,
    PaymentMethod.notChoosed,
  ];
  reserveSeat(int paymentIndex) {
    emit(BeforeChangePaymentMethod());
    if (paymentMethod[paymentIndex] != PaymentMethod.choosed) {
      paymentMethod[paymentIndex] = PaymentMethod.choosed;
      if (paymentIndex == 0) {
        paymentMethod[1] = PaymentMethod.notChoosed;
        paymentMethod[2] = PaymentMethod.notChoosed;
      } else if (paymentIndex == 1) {
        paymentMethod[0] = PaymentMethod.notChoosed;
        paymentMethod[2] = PaymentMethod.notChoosed;
      } else if (paymentIndex == 2) {
        paymentMethod[0] = PaymentMethod.notChoosed;
        paymentMethod[1] = PaymentMethod.notChoosed;
      }
    }
    emit(ChangePaymentMethod());
  }
}
