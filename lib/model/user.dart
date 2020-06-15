import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String nickname;
  final String avatarUrl;
  final String profileUrl;

  const User({
    this.nickname,
    this.avatarUrl,
    this.profileUrl,
  });

  @override
  List<Object> get props => [nickname, avatarUrl, profileUrl];

  @override
  String toString() => 'User { nickname: $nickname }';
}

class UserSpecific {}
