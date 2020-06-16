import 'dart:convert';

import 'package:dumulmury/model/user_detail.dart';
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
            profileUrl: elem['html_url'],
          ),
        )
        .toList();
    return users;
  }

  Future<UserDetail> getUserDetail(String nickname) async {
    final response = await userProvider.getUser(userId: nickname);
    final body = json.decode(response.body);
    final user = UserDetail(
      location: body['location'],
      email: body['email'],
      publicRepo: body['public_repos'],
      followers: body['followers'],
    );
    return user;
  }
}
