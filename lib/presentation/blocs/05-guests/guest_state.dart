part of 'guest_bloc.dart';

enum GuesFilter {
  all,
  invited,
  noInvited,
}

class GuestState extends Equatable {
  final GuesFilter filter;
  final List<Todo> guests;

  const GuestState({
    this.filter = GuesFilter.all,
    this.guests = const [],
  });

  GuestState copyWith({
    GuesFilter? filter,
    List<Todo>? guests,
  }) {
    return GuestState(
      filter: filter ?? this.filter,
      guests: guests ?? this.guests,
    );
  }

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuesFilter.invited:
        return guests.where((element) => element.done).toList();
      case GuesFilter.noInvited:
        return guests.where((element) => !element.done).toList();
      case GuesFilter.all:
        return guests;
      default:
        throw Exception('Errorrrrr Filter');
    }
  }

  @override
  List<Object> get props => [filter, guests];
}

//final class GuestInitial extends GuestState {}
