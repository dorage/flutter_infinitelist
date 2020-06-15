import 'package:dumulmury/components/gradient_shader_mask.dart';
import 'package:dumulmury/components/round_navigation_button.dart';
import 'package:dumulmury/model/user.dart';
import 'package:dumulmury/screens/user_detail/user_detail.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final User user;
  ListViewItem({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 150,
      child: RoundNavigationButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserDetail(user: user),
            ),
          );
        },
        children: <Widget>[
          Text(
            '${user.nickname} ▸',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          GradientShaderMask(
            child: Image.network(
              '${user.avatarUrl}',
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewItemWithCircular extends StatelessWidget {
  final User user;
  ListViewItemWithCircular({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 150,
      child: RoundNavigationButton(
        onPressed: () {},
        children: <Widget>[
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
