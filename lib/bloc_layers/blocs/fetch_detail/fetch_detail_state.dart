part of 'fetch_detail_bloc.dart';

@immutable
abstract class FetchDetailState {
  const FetchDetailState();
}

class FetchDetailInitial extends FetchDetailState {}

class FetchDetailLoaded extends FetchDetailState {
  final User user;
  final UserDetail userDetail;
  const FetchDetailLoaded({@required this.user, @required this.userDetail});

  @override
  String toString() => 'FetchDetailLoaded { repos: ${userDetail.publicRepo} }';
}

class FetchDetailFailure extends FetchDetailState {
  final Error error;

  const FetchDetailFailure({@required this.error});

  @override
  String toString() => 'FetchFailure { error: ${error.toString()}}';
}
