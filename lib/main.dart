import 'package:dumulmury/bloc_layers/block_delegate.dart';
import 'package:dumulmury/bloc_layers/blocs/fetch/fetch_bloc.dart';
import 'package:dumulmury/bloc_layers/repositories/users_repository.dart';
import 'package:dumulmury/screens/user_list/user_list.dart';
import 'package:dumulmury/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final usersRepository = UsersRepository();

  runApp(
    BlocProvider<FetchBloc>(
      create: (context) =>
          FetchBloc(usersRepository: usersRepository)..add(Fetch()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub User List',
      theme: theme,
      home: UserList(),
    );
  }
}
