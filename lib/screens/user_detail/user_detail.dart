import 'package:dumulmury/bloc_layers/blocs/fetch/fetch_bloc.dart';
import 'package:dumulmury/bloc_layers/blocs/fetch_detail/fetch_detail_bloc.dart';
import 'package:dumulmury/components/round_navigation_button.dart';
import 'package:dumulmury/model/user.dart';
import 'package:dumulmury/screens/user_detail/components/user_info.dart';
import 'package:dumulmury/themes/main_theme.dart';
import 'package:flexiblelayout/flexiblelayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: BlocProvider<FetchDetailBloc>(
        create: (context) {
          return FetchDetailBloc(
              usersRepository:
                  BlocProvider.of<FetchBloc>(context).usersRepository)
            ..add(FetchDetail(user: user));
        },
        child: FlexibleLayout(
          color: defaultColor,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          flexList: [4, 2, 1],
          children: <Widget>[
            // profile 사진
            Image.network(
              '${user.avatarUrl}',
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            // user 정보
            UserInfo(),
            // repository 링크 버튼
            RoundNavigationButton(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Repository ▶',
                    style: nicknameTheme,
                  ),
                  Image.asset('assets/images/github_mark_w.png'),
                ],
              ),
              onPressed: () => _launchUrl(user.profileUrl),
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
