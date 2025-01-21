import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_theme_states.dart';

class GetThemeCubit extends Cubit<GetThemeStates> {
  // Initial theme state is Light
  bool isDarkMode = false; // Keep track of the current theme mode
  
  GetThemeCubit() : super(LightTheme());

  // This method toggles between light and dark themes
  void toggleTheme() {
    isDarkMode = !isDarkMode; // Toggle the boolean flag
    if (isDarkMode) {
      emit(DarkTheme()); // sEmit dark theme state
    } else {
      emit(LightTheme()); // Emit light theme state
    }
  }
}
