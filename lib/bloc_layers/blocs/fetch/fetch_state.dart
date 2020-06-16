part of 'fetch_bloc.dart';

@immutable
abstract class FetchState extends Equatable {
  const FetchState();

  @override
  List<Object> get props => [];
}

class FetchInitial extends FetchState {}

class FetchFailure extends FetchState {
  final Error error;

  const FetchFailure({@required this.error});

  @override
  String toString() => 'FetchFailure { error: ${error.toString()}}';
}

class FetchLoaded extends FetchState {
  final List<User> users;
  final bool hasReachedMax;

  const FetchLoaded({@required this.users, @required this.hasReachedMax});

  FetchLoaded copyWith({
    @required List<User> users,
    @required bool hasReachedMax,
  }) {
    return FetchLoaded(users: users, hasReachedMax: hasReachedMax);
  }

  @override
  List<Object> get props => [users, hasReachedMax];

  @override
  String toString() =>
      'FetchLoaded { users: ${users.length}, hasReachedMax: $hasReachedMax }';
}
