import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dumulmury/bloc_layers/repositories/users_repository.dart';
import 'package:dumulmury/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  @override
  FetchState get initialState => FetchInitial();

  final UsersRepository usersRepository;

  FetchBloc({@required this.usersRepository}) : assert(usersRepository != null);

  @override
  Stream<FetchState> mapEventToState(
    FetchEvent event,
  ) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      yield FetchLoading();
      try {
        // 첫 Fetch
        if (currentState is FetchInitial) {
          final users = await usersRepository.getUsersList(
            since: 0,
            perPage: 20,
          );
          yield FetchLoaded(
            users: users,
            hasReachedMax: users.isEmpty,
          );
        }
        // 첫 Fetch 이후
        if (currentState is FetchLoaded) {
          final users = await usersRepository.getUsersList(
            since: currentState.users.length,
            perPage: 20,
          );
          // 빈 리스트인지 체크
          final hasReachedMax = users.isEmpty;
          yield hasReachedMax
              ? currentState.copyWith(
                  users: currentState.users + users,
                  hasReachedMax: hasReachedMax)
              : FetchLoaded(users: users, hasReachedMax: hasReachedMax);
        }
      } catch (error) {
        yield FetchFailure(error: error);
      }
    }
  }

  bool _hasReachedMax(FetchState currentState) {
    // 현재 state가 FetchLoaded 이고 hasReachedMax가 false일때 Fetch이벤트를 실행
    return currentState is FetchLoaded && currentState.hasReachedMax;
  }
}
