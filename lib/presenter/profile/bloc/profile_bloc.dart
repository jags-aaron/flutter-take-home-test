import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/domain/use_cases/get_user_data_use_case.dart';

import 'profile_bloc_event.dart';
import 'profile_bloc_state.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  final GetUserDataUseCase _getUserData;

  ProfileBloc({
    required GetUserDataUseCase getUserData,
  })  : _getUserData = getUserData,
        super(
          const ProfileBlocState(),
        ) {
    on<GetUserDataEvent>((event, emit) => _getUserDataStream(event, emit));
  }

  void _getUserDataStream(
    GetUserDataEvent event,
    Emitter<ProfileBlocState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: ProfileBlocResult.loading),
      );

      final userResult = await _getUserData.execute();
      emit(
        state.copyWith(
          status: ProfileBlocResult.userDataRetrieved,
          user: userResult,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          status: ProfileBlocResult.error,
          error: e.toString(),
        ),
      );
    }
  }
}
