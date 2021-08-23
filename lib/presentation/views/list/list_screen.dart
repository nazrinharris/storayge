import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/features/cabinet/domain/entities/item.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  const ListScreenHeader(),
                  verticalSpace14,
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
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
