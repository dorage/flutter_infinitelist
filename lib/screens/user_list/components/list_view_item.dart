import 'package:dumulmury/components/gradient_shader_mask.dart';
import 'package:dumulmury/components/round_navigation_button.dart';
import 'package:dumulmury/model/user.dart';
import 'package:dumulmury/screens/user_detail/user_detail.dart';
import 'package:dumulmury/themes/main_theme.dart';
import 'package:flexiblelayout/flexiblelayout.dart';
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
          child: FlexibleLayout(
            isColumn: false,
            color: Colors.transparent,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            flexList: [5, 2],
            children: <Widget>[
              Text(
                user.nickname,
                overflow: TextOverflow.ellipsis,
                style: nicknameTheme,
              ),
              GradientShaderMask(
                child: Image.network(
                  user.avatarUrl,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          )),
    );
  }
}
