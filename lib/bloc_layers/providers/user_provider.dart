import 'package:meta/meta.dart';
import 'package:http/http.dart';

class UserProvider {
  const UserProvider();

  /// since번째 부터 perPage 수만큼의 user 리스트를 불러옵니다.
  Future<dynamic> getUsers({@required int since, @required int perPage}) async {
    final client = Client();
    final response = await client
        .get('https://api.github.com/users?since=${since}&per_page=${perPage}');
    if (response.statusCode != 200) {
      throw UsersError(body: response.body);
    }
    return response;
  }

  Future<dynamic> getUser({@required String userId}) async {
    final client = Client();
    final response = await client.get('https://api.github.com/users/${userId}');
    if (response.statusCode != 200) {
      throw UserError(body: response.body);
    }
    return response;
  }
}

class UsersError extends Error {
  final String body;
  UsersError({this.body});

  @override
  String toString() => 'Error on getUsers { body: ${body} }';
}

class UserError extends Error {
  final String body;
  UserError({this.body});

  @override
  String toString() => 'Error on getUser { body: ${body} }';
}
