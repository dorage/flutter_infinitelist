import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:dumulmury/bloc_layers/providers/user_provider.dart';
import 'package:dumulmury/model/user.dart';

class UsersRepository {
  final userProvider = UserProvider();

  // Fetch Data
  Future<List<User>> getUsersList(
      {@required int since, @required int perPage}) async {
    final response =
        await userProvider.getUsers(since: since, perPage: perPage);
    final body = json.decode(response.body) as List;
    final users = body
        .map<User>(
          (elem) => User(
            nickname: elem['login'],
            avatarUrl: elem['avatar_url'],
            profileUrl: elem['url'],
          ),
        )
        .toList();
    return users;
  }
}
