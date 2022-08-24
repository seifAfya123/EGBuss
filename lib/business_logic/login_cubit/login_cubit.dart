import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testapp/data/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginUser(UserModel user) async {
    emit(LoadingState());
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    print(user.phone);
    print(user.password);
    emit(SuccessState());
  }
}
