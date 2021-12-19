import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/new_app/theme_cubit/status.dart';
import 'package:news_app/shared/network/local/cash_helper.dart';


class AppCubit extends Cubit<AppStatus> {
  AppCubit() : super(AppInitialStatus());

  static AppCubit get(context) => BlocProvider.of(context);

  ThemeMode appMode = ThemeMode.dark;
  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CashHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}