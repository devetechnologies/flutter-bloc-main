import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guest_event.dart';
part 'guest_state.dart';

const uuid = Uuid();

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc()
      : super(GuestState(guests: [
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null,
          ),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now())
        ])) {
    /* on<SetInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuesFilter.invited));
    });
    on<SetNotInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuesFilter.noInvited));
    });
    on<SetAllFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuesFilter.all));
    });*/
    on<SetCumstomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });

    on<AddGuesEvent>(_addTodoGuest);
    on<ToogleGuest>(_toogleGuestHandler);
  }

  void changeFilter(GuesFilter newFilter) {
    add(SetCumstomFilterEvent(
        newFilter)); /*switch (newFilter) {
      case GuesFilter.all:
        add(SetAllFilterEvent());
      case GuesFilter.invited:
        add(SetInvitedFilterEvent());
      case GuesFilter.noInvited:
        add(SetNotInvitedFilterEvent());
        break;
    }*/
  }

  FutureOr<void> _addTodoGuest(AddGuesEvent event, Emitter<GuestState> emit) {
    emit(state.copyWith(guests: [...state.guests, event.todoPerson]));
  }

  FutureOr<void> _toogleGuestHandler(
      ToogleGuest event, Emitter<GuestState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();
    emit(state.copyWith(guests: newGuests));
  }

  void addTodo() {
    final newTodoPerson = Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now());
//    add(AddGuesEvent(todoPerson: newTodoPerson));
    add(AddGuesEvent(todoPerson: newTodoPerson));
  }

  void toogleGuest(String id) {
    add(ToogleGuest(id: id));
  }
}
