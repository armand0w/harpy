import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harpy/api/api.dart';
import 'package:harpy/components/common/timeline/list_timeline/bloc/list_timeline_bloc.dart';
import 'package:harpy/components/common/timeline/list_timeline/widgets/list_timeline.dart';
import 'package:harpy/components/components.dart';

class ListTimelineScreen extends StatelessWidget {
  const ListTimelineScreen({
    @required this.list,
  });

  final TwitterListData list;

  static const String route = 'list_timeline_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListTimelineBloc>(
      create: (_) => ListTimelineBloc(listId: list.idStr),
      child: HarpyScaffold(
        body: ScrollDirectionListener(
          child: ScrollToStart(
            child: ListTimeline(
              listId: list.idStr,
              beginSlivers: <Widget>[
                HarpySliverAppBar(
                  title: list.name,
                  floating: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
