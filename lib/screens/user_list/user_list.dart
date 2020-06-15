import 'package:dumulmury/bloc_layers/blocs/fetch/fetch_bloc.dart';
import 'package:dumulmury/screens/user_list/components/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  FetchBloc _fetchBloc;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _fetchBloc = BlocProvider.of<FetchBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset(
            'assets/images/github_logo_w.png',
            height: 60,
          ),
        ),
      ),
      body: BlocBuilder<FetchBloc, FetchState>(
        builder: (context, state) {
          if (state is FetchInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchFailure) {
            return Text('Error');
          }
          if (state is FetchLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.users.length
                  : state.users.length + 1,
              itemBuilder: (context, index) {
                if (state.hasReachedMax && index == state.users.length - 1) {
                  return ListViewItemWithCircular();
                }
                return ListViewItem(
                  user: state.users[index],
                );
              },
            );
          }
          if (state is FetchLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _fetchBloc.add(Fetch());
    }
  }
}
