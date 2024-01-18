part of 'guest_bloc.dart';

sealed class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

final class SetAllFilterEvent extends GuestEvent {}

final class SetInvitedFilterEvent extends GuestEvent {}

final class SetNotInvitedFilterEvent extends GuestEvent {}

final class SetCumstomFilterEvent extends GuestEvent {
  final GuesFilter newFilter;

  const SetCumstomFilterEvent(this.newFilter);
}

final class AddGuesEvent extends GuestEvent {
  final Todo todoPerson;

  const AddGuesEvent({required this.todoPerson});
}

final class ToogleGuest extends GuestEvent {
  final String id;

  const ToogleGuest({required this.id});
}
