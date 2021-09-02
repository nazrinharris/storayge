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
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverPersistentHeader(
                        delegate: ListScreenHeaderDelegate(
                          maxExtent: 120,
                          minExtent: 120,
                        ),
                      ),
                      CupertinoSliverRefreshControl(
                        onRefresh: () async {
                          return Future.delayed(3.seconds);
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
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
              child: Material(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(20.0),
                child: Ink(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {},
                    splashColor:
                        Theme.of(context).primaryColor.withOpacity(0.20),
                    highlightColor:
                        Theme.of(context).primaryColor.withOpacity(0.15),
                    child: Row(
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
                              style: appTextTheme(context)
                                  .headline2!
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 14),
                          child: Icon(Icons.navigate_next),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: currentState.allListSgSnip.length,
        ),
      );
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

const String tStoraygeGroupName = 'test_storayge_group_name';
const String tStoraygeGroupId = 'test_storayge_group_id';
const String tStoraygeGroupDesc = 'test_storayge_group_desc';
const String tImgPath = 'test_img_path';
const String tPathName = 'test_path_name';
const int tStoraygeGroupAmount = 0;
const int tItemAmount = 0;
List<StoraygeGroup> tStoraygeGroupList = [];
List<Item> tItemList = [];
List<String?>? tStoraygeGroupImages = [];
String? tStoraygeGroupPathName = 'test_storayge_group_path_name';

const String tStoraygeGroupName2 = 'test_storayge_group_name_2';
const String tStoraygeGroupId2 = 'test_storayge_group_id_2';
const String tStoraygeGroupDesc2 = 'test_storayge_group_desc_2';
const String tImgPath2 = 'test_img_path_2';
const String tPathName2 = 'test_path_name_2';
const int tStoraygeGroupAmount2 = 0;
const int tItemAmount2 = 0;
List<StoraygeGroup> tStoraygeGroupList2 = [];
List<Item> tItemList2 = [];
List<String?>? tStoraygeGroupImages2 = [];
String? tStoraygeGroupPathName2 = 'test_storayge_group_path_name_2';

const String tStoraygeGroupName3 = 'test_storayge_group_name_3';
const String tStoraygeGroupId3 = 'test_storayge_group_id_3';
const String tStoraygeGroupDesc3 = 'test_storayge_group_desc_3';
const String tImgPath3 = 'test_img_path_3';
const String tPathName3 = 'test_path_name_3';
const int tStoraygeGroupAmount3 = 0;
const int tItemAmount3 = 0;
List<StoraygeGroup> tStoraygeGroupList3 = [];
List<Item> tItemList3 = [];
List<String?>? tStoraygeGroupImages3 = [];
String? tStoraygeGroupPathName3 = 'test_storayge_group_path_name_3';
