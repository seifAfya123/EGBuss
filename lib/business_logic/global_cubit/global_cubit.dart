import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/language_manager.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  changeLanguagePressed() async {
    await LanguageManager.changeAppLanguage();
    emit(LanguageChangedState());
  }

  ////////////////////////navigator
  Future navigate({VoidCallback? afterSuccess}) async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    afterSuccess!();
  }

  static get(BuildContext context) {}
}
