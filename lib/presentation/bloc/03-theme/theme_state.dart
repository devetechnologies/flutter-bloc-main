part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});
  //final bool isDarkMode;
  //final bool isDarkMode;

  @override
  List<Object> get props => [isDarkMode];
}

/*final class ThemeInitial extends ThemeState {}

final class ThemeDark extends ThemeState {}

final class ThemeLight extends ThemeState {}*/
