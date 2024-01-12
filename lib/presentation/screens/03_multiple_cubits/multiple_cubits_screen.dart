import 'package:blocs_app/presentation/bloc/02-counter-cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/03-theme/theme_cubit.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
                icon: state.isDarkMode
                    ? const Icon(Icons.light_mode_outlined, size: 100)
                    : const Icon(Icons.dark_mode_outlined, size: 100),
                onPressed: () {
                  context.read<ThemeCubit>().toogleTheme();
                },
              );
            },
          ),
          const Text('Fernando Herrera', style: TextStyle(fontSize: 25)),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return TextButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 50,
                ),
                label: Text(state.toString(),
                    style: const TextStyle(fontSize: 100)),
                onPressed: () {
                  context.read<CounterCubit>().incrementBy(2);
                },
              );
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
    );
  }
}
