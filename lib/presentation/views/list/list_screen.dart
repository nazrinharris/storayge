// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/features/cabinet/domain/entities/item.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/views/list/bloc/list_screen_bloc.dart';
import 'package:supercharged/supercharged.dart';

import '../../../locator.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListScreenBloc(
            cabinetCubit: locator(),
            authCubit: locator(),
          ),
        )
      ],
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Builder(
            builder: (context) {
              context.read<ListScreenBloc>().add(LSexecGetAllListSGSnip());

              return BlocBuilder<ListScreenBloc, ListScreenState>(
                builder: (context, state) {
                  return CustomScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    slivers: [
                      SliverPersistentHeader(
                        delegate: ListScreenHeaderDelegate(
                          maxExtent: 120,
                          minExtent: 120,
                        ),
                      ),
                      CupertinoSliverRefreshControl(
                        onRefresh: () async {
                          context
                              .read<ListScreenBloc>()
                              .add(LSexecGetAllListSGSnip());
                          ListScreenState currentState =
                              context.read<ListScreenBloc>().state;

                          if (currentState is LSLoading) {
                          } else if (currentState is LSLoadedAllListSGSnip) {
                            return Future.value();
                          }
                        },
                      ),
                      StoraygeGroupHeadingSliver(),
                      StoraygeGroupSliverBuilder(),
                      SliverWhiteSpace(80),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class StoraygeGroupHeadingSliver extends StatelessWidget {
  const StoraygeGroupHeadingSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 22,
                  top: 20,
                  bottom: 14,
                  right: 14,
                ),
                child: Text(
                  'Your Groups',
                  style: appTextTheme(context).headline3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StoraygeGroupSliverBuilder extends StatefulWidget {
  const StoraygeGroupSliverBuilder({Key? key}) : super(key: key);

  @override
  _StoraygeGroupSliverBuilderState createState() =>
      _StoraygeGroupSliverBuilderState();
}

class _StoraygeGroupSliverBuilderState
    extends State<StoraygeGroupSliverBuilder> {
  @override
  Widget build(BuildContext context) {
    final ListScreenState currentState = context.read<ListScreenBloc>().state;

    if (currentState is LSLoadedAllListSGSnip) {
      return SliverListCardBuilder(currentState: currentState);
    } else if (currentState is LSError) {
      return SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              alignment: Alignment.center,
              color: Colors.pink,
              child: Text("${currentState.message} : ${currentState.code}"),
            )
          ],
        ),
      );
    } else if (currentState is LSLoading) {
      return SliverList(
          delegate: SliverChildListDelegate([
        CircularProgressIndicator(),
        Container(
          alignment: Alignment.center,
          color: Colors.yellow,
          child: Text(currentState.currentOperationMessage),
        )
      ]));
    } else if (currentState is LSInitial) {
      return SliverList(
          delegate: SliverChildListDelegate([
        CircularProgressIndicator(),
        Container(
          alignment: Alignment.center,
          color: Colors.yellow,
          child: Text('LS INITIAL'),
        )
      ]));
    } else {
      throw UnexpectedException(code: 'code', message: 'Unknown State');
    }
  }
}

class SliverListCardBuilder extends StatefulWidget {
  const SliverListCardBuilder({
    Key? key,
    required this.currentState,
  }) : super(key: key);

  final LSLoadedAllListSGSnip currentState;

  @override
  _SliverListCardBuilderState createState() => _SliverListCardBuilderState();
}

class _SliverListCardBuilderState extends State<SliverListCardBuilder> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
            child: StoraygeExpandableListCard(
              currentState: widget.currentState,
              index: index,
            ),
          );
        },
        childCount: 2,
      ),
    );
  }
}

class StoraygeExpandableListCard extends StatefulWidget {
  const StoraygeExpandableListCard({
    Key? key,
    required this.currentState,
    required this.index,
  }) : super(key: key);

  final LSLoadedAllListSGSnip currentState;
  final int index;

  @override
  _StoraygeExpandableListCardState createState() =>
      _StoraygeExpandableListCardState();
}

class _StoraygeExpandableListCardState
    extends State<StoraygeExpandableListCard> {
  @override
  Widget build(BuildContext context) {
    final StoraygeGroupSnippet sgSnip =
        widget.currentState.allListSgSnip[widget.index];

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        children: [
          if (sgSnip.sgImgPath != 'none')
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/${sgSnip.sgImgPath}'),
                  ),
                ),
                child: Opacity(
                  opacity: 0.0,
                  child: StoraygeListCardRawContent(
                    currentState: widget.currentState,
                    index: widget.index,
                  ),
                ),
              ),
            ),
          Material(
            color: resolveDefaultBackgroundColor(context, sgSnip.sgImgPath),
            child: Ink(
              child: InkWell(
                splashColor: Theme.of(context).primaryColor.withOpacity(0.20),
                highlightColor:
                    Theme.of(context).primaryColor.withOpacity(0.15),
                onTap: () {},
                child: StoraygeListCardRawContent(
                  currentState: widget.currentState,
                  index: widget.index,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                color: Colors.red,
                child: Icon(Icons.expand_more),
              ),
              IgnorePointer(
                child: Opacity(
                  opacity: 0.0,
                  child: StoraygeListCardRawContent(
                    currentState: widget.currentState,
                    index: widget.index,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StoraygeListCardRawContent extends StatelessWidget {
  const StoraygeListCardRawContent({
    Key? key,
    required this.currentState,
    required this.index,
  }) : super(key: key);

  final LSLoadedAllListSGSnip currentState;
  final int index;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              currentState.allListSgSnip[index].sgName,
              style: appTextTheme(context).headline2!.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(width: 51)
      ],
    );
  }
}

Color resolveDefaultBackgroundColor(BuildContext context, String imgPath) {
  if (imgPath == 'none') {
    return Theme.of(context).canvasColor;
  } else {
    return Theme.of(context).canvasColor.withOpacity(0.5);
  }
}

class ListScreenHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;

  ListScreenHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).backgroundColor.withOpacity(0.0),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'list',
                    style: appTextTheme(context)
                        .headline1!
                        .copyWith(fontSize: 48.sp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline),
                  )
                ],
              ),
            ),
            Container(
              key: const Key('search-bar'),
              height: 32.0,
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class ListScreenHeader extends StatelessWidget {
  const ListScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'list',
                style:
                    appTextTheme(context).headline1!.copyWith(fontSize: 48.sp),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline))
            ],
          ),
        ),
        Container(
          key: const Key('search-bar'),
          height: 32.0,
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ],
    );
  }
}

class SliverWhiteSpace extends StatelessWidget {
  final double height;

  const SliverWhiteSpace(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: height,
        )
      ]),
    );
  }
}
