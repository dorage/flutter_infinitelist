part of 'fetch_detail_bloc.dart';

@immutable
abstract class FetchDetailEvent {
  const FetchDetailEvent();
}

class FetchDetail extends FetchDetailEvent {
  final User user;
  const FetchDetail({this.user});
}
