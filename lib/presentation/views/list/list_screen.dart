import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/features/cabinet/domain/entities/item.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  const ListScreenHeader(),
                  verticalSpace14,
                ],
              ),
              StoraygeGroupList(),
            ],
          ),
        ),
      ),
    );
  }
}

class StoraygeGroupList extends StatefulWidget {
  StoraygeGroupList({Key? key}) : super(key: key);

  @override
  _StoraygeGroupListState createState() => _StoraygeGroupListState();
}

class _StoraygeGroupListState extends State<StoraygeGroupList> {
  @override
  void initState() {
    super.initState();
    context.read<ListScreenBloc>().add(ListScreenEvent.execGetAllListSGSnip());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScreenBloc, ListScreenState>(
        builder: (context, state) {
      final ListScreenState currentState = context.read<ListScreenBloc>().state;

      context.read<ListScreenBloc>().stream.listen((event) {
        setState(() {});
      });

      return AnimatedSwitcher(
        duration: 1.seconds,
        child: resolveChild(currentState),
      );
    });
  }

  Widget resolveChild(ListScreenState currentState) {
    if (currentState is LSLoadedAllListSGSnip) {
      return ListView.builder(
        itemCount: currentState.allListSgSnip.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(currentState.allListSgSnip[index].sgId),
          );
        },
      );
    } else if (currentState is LSError) {
      return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text(currentState.message),
      );
    } else if (currentState is LSLoading) {
      return const CircularProgressIndicator();
    } else if (currentState is LSInitial) {
      return const CircularProgressIndicator(
        color: Colors.red,
      );
    } else {
      throw UnexpectedException(code: 'code', message: 'Unknown State');
    }
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
