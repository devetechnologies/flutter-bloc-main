import 'package:blocs_app/presentation/blocs/05-guests/guest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<GuestBloc>().addTodo();
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        BlocBuilder<GuestBloc, GuestState>(
          builder: (context, state) {
            return SegmentedButton(
              segments: const [
                ButtonSegment(value: GuesFilter.all, icon: Text('Todos')),
                ButtonSegment(
                    value: GuesFilter.invited, icon: Text('Invitados')),
                ButtonSegment(
                    value: GuesFilter.noInvited, icon: Text('No invitados')),
              ],
              selected: <GuesFilter>{state.filter},
              onSelectionChanged: (value) {
                context.read<GuestBloc>().changeFilter(value.first);
              },
            );
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: BlocBuilder<GuestBloc, GuestState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.filteredGuests.length,
                itemBuilder: (context, index) {
                  final guest = state.filteredGuests[index];
                  return SwitchListTile(
                      title: Text(guest.description),
                      value: guest.done,
                      onChanged: (value) {
                        context.read<GuestBloc>().toogleGuest(guest.id);
                      });
                },
              );
            },
          ),
        )
      ],
    );
  }
}
