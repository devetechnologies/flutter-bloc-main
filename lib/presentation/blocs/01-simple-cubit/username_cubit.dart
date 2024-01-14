import 'package:bloc/bloc.dart';

class UserNameCubit extends Cubit<String> {
  UserNameCubit() : super('there-isnt-buttom');

  void setName(String name) {
    emit(name);
  }
}
