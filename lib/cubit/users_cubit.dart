import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_cs_test/models/users_model.dart';
import 'package:bloc_pattern_cs_test/repo/users_repo.dart';

import 'package:equatable/equatable.dart';

import '../models/users_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  UsersCubit(this.usersRepo) : super(UsersLoadingState());
  onLoadUsers() async {
    try {
      emit(UsersLoadingState());
      var data = await usersRepo.getUsers();
      emit(UsersLoadedState(data));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
