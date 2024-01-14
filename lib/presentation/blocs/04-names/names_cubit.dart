import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'names_state.dart';

class NamesCubit extends Cubit<NamesState> {
  NamesCubit({String name = 'Manuel Montolio'})
      : super(NamesInitial(name: name));

  void setName(String name) {
    emit(ChangeNameState(name: name));
  }
}
