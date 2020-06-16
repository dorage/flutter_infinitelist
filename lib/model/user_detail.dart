import 'package:dumulmury/model/user.dart';
import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  final User user;
  final String location;
  final String email;
  final int publicRepo;
  final int followers;

  const UserDetail({
    this.user,
    this.location,
    this.email,
    this.publicRepo,
    this.followers,
  });

  @override
  List<Object> get props => [
        location,
        email,
        publicRepo,
        followers,
      ];

  @override
  String toString() => 'UserDetail { }';
}
