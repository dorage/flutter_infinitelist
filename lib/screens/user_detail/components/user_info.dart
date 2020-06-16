import 'package:dumulmury/bloc_layers/blocs/fetch_detail/fetch_detail_bloc.dart';
import 'package:dumulmury/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDetailBloc, FetchDetailState>(
      builder: (context, state) {
        return Container(
          child: state is FetchDetailLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${state.user.nickname}',
                      style: userDetailNicknameTheme,
                    ),
                    Divider(
                      color: Colors.grey[100],
                    ),
                    _detailListTile(
                      icon: Icons.location_on,
                      titleKey: 'location',
                      titleValue: state.userDetail.location,
                    ),
                    _detailListTile(
                      icon: Icons.person,
                      titleKey: 'followers',
                      titleValue: state.userDetail.followers,
                    ),
                    _detailListTile(
                      icon: Icons.location_on,
                      titleKey: 'public repositories',
                      titleValue: state.userDetail.publicRepo,
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _detailListTile extends StatelessWidget {
  final String titleKey;
  final dynamic titleValue;
  final IconData icon;

  static const noAvaliable = 'No Avaliable';
  const _detailListTile({Key key, this.titleKey, this.titleValue, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.white),
        Text(
          '${titleKey} : ${titleValue ?? noAvaliable}',
          style: detailTextTheme,
        ),
      ],
    );
  }
}
