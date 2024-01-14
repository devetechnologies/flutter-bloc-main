part of 'names_cubit.dart';

sealed class NamesState extends Equatable {
  const NamesState();

  @override
  List<Object> get props => [];
}

final class NamesInitial extends NamesState {
  final String name;

  const NamesInitial({required this.name});
  @override
  List<Object> get props => [name.toString()];

  @override
  String toString() {
    // TODO: implement toString

    return name.toString();
  }
}

final class ChangeNameState extends NamesState {
  final String name;

  const ChangeNameState({required this.name});
  @override
  List<Object> get props => [name.toString()];

  @override
  String toString() {
    // TODO: implement toString

    return name.toString();
  }
}
