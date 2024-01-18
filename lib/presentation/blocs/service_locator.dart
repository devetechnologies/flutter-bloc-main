import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

import '../../config/config.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UserNameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(NamesCubit());
  getIt.registerSingleton(GuestBloc());
}
