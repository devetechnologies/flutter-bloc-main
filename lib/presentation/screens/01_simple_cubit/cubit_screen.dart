import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/bloc/01-simple-cubit/username_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final userNameCubit = context.watch<UserNameCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UserNameCubit, String>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            // print('KLKKKKKKK');
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<UserNameCubit>()
              .setName(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
