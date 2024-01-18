import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<UserNameCubit>()),
      BlocProvider(create: (context) => getIt<RouterSimpleCubit>()),
      BlocProvider(create: (context) => getIt<CounterCubit>()),
      BlocProvider(create: (context) => getIt<ThemeCubit>()),
      BlocProvider(create: (context) => getIt<NamesCubit>()),
      BlocProvider(create: (context) => getIt<GuestBloc>())
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Flutter BLoC',
          debugShowCheckedModeBanner: false,
          routerConfig: context.watch<RouterSimpleCubit>().state,
          theme: AppTheme(isDarkmode: state.isDarkMode).getTheme(),
        );
      },
    );
  }
}
