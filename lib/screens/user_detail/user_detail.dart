import 'package:dumulmury/components/round_navigation_button.dart';
import 'package:dumulmury/model/user.dart';
import 'package:flexiblelayout/flexiblelayout.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.nickname}\'s detail'),
      ),
      body: FlexibleLayout(
        flexList: [4, 1, 2],
        children: <Widget>[
          Image.network(
            '${user.avatarUrl}',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Text('${user.nickname}'),
          RoundNavigationButton(
            onPressed: () {},
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
