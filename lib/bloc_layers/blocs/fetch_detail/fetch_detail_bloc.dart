import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dumulmury/bloc_layers/repositories/users_repository.dart';
import 'package:dumulmury/model/user.dart';
import 'package:dumulmury/model/user_detail.dart';
import 'package:meta/meta.dart';

part 'fetch_detail_event.dart';
part 'fetch_detail_state.dart';

class FetchDetailBloc extends Bloc<FetchDetailEvent, FetchDetailState> {
  UsersRepository usersRepository;

  FetchDetailBloc({this.usersRepository});

  @override
  FetchDetailState get initialState => FetchDetailInitial();

  @override
  Stream<FetchDetailState> mapEventToState(
    FetchDetailEvent event,
  ) async* {
    if (event is FetchDetail) {
      try {
        final userDetail =
            await usersRepository.getUserDetail(event.user.nickname);
        yield FetchDetailLoaded(user: event.user, userDetail: userDetail);
      } catch (error) {
        yield FetchDetailFailure(error: error);
      }
    }
  }
}
