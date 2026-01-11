import 'package:fintech_app/core/helpers/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(this._sharedPref) : super(_sharedPref.getAppMode() ?? false);
  final SharedPref _sharedPref;

  void toggleTheme() {
    final isDark = !state;
    emit(isDark);
    // Save in background without blocking UI
    _sharedPref.saveAppMode(isDark);
  }
}
