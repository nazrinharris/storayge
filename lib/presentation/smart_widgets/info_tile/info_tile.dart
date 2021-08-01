import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:supercharged/supercharged.dart';

import 'bloc/info_tile_bloc.dart';

enum InfoTileStatus { loading, success, error }

/// Guide on using [InfoTileOverlay]
///
/// [InfoTileOverlay] is a fairly simple widget that positions the [InfoTile] to the top
/// of the screen with respect to the top padding from [SafeArea]
///
/// This widget is meant to be used inside of a [Stack] which takes up the whole screen.
class InfoTileOverlay extends StatelessWidget {
  final InfoTile infoTile;

  const InfoTileOverlay({Key? key, required this.infoTile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: AnimatedSwitcher(
          duration: 500.milliseconds,
        ),
      ),
    );
  }
}

class InfoTile extends StatefulWidget {
  /// Guide on using [InfoTile]
  ///
  /// Precautions : -
  ///
  /// 1. Make sure [InfoTileBloc] has been created and properly provided to the widget tree. Use [Builder] if
  /// you cannot access the bloc in the correct context.
  ///
  /// 2. If you call [triggerStateChange()], and the [isAbleToExpand] property is different from before,
  /// make sure [isExpanded] property is set to [false]. This must be done in order to trigger the state change properly.
  ///
  /// 3. The [child] is aligned at the center of the space available for it. If you want to set an alignment of your own,
  /// simply wrap the widget you are providing to the child with a [Container] and set the alignment yourself. Of course,
  /// this can be whatever you want. The point is, the parent of the widget provided to [child] will take up the available
  /// space. I think.

  const InfoTile({
    Key? key,
  }) : super(key: key);

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> with AnimationMixin {
  late AnimationController _childrenHeightFactorController;

  late Animation<double> _childrenHeightFactor;
  late Animation<double> _horizontalLeadingPadding;
  late Animation<double> _topLeadingPadding;
  late Animation<double> _iconRotation;
  late Animation<double> _opacity;
  late Animation<double> _fontSize;

  bool _isExpanded = false;

  InfoTileProps readProps(BuildContext context) =>
      context.read<InfoTileBloc>().state.infoTileProps;

  @override
  void initState() {
    super.initState();

    _childrenHeightFactorController = createController();
    _childrenHeightFactor = CurvedAnimation(
      parent: _childrenHeightFactorController,
      curve: Curves.easeOutExpo,
      reverseCurve: Curves.easeInExpo,
    );
    _horizontalLeadingPadding =
        Tween<double>(begin: 14, end: 24).animate(_childrenHeightFactor);
    _iconRotation =
        Tween<double>(begin: 0, end: math.pi).animate(_childrenHeightFactor);
    _opacity = Tween<double>(begin: 0, end: 1).animate(_childrenHeightFactor);
    _fontSize = Tween<double>(begin: 16.0.sp, end: 18.0.sp)
        .animate(_childrenHeightFactor);
    _topLeadingPadding =
        Tween<double>(begin: 0.0, end: 6.0).animate(_childrenHeightFactor);
    _isExpanded = context.read<InfoTileBloc>().state.infoTileProps.isExpanded;

    if (_isExpanded) {
      _childrenHeightFactorController.value = 1.0;
    }
  }

  void _handleTap() {
    setState(() {
      _isExpanded =
          !context.read<InfoTileBloc>().state.infoTileProps.isExpanded;
      if (_isExpanded) {
        _childrenHeightFactorController.play(duration: 350.milliseconds);
        context.read<InfoTileBloc>().add(const InfoTileEvent.toggleExpansion());
      } else {
        _childrenHeightFactorController.playReverse(duration: 350.milliseconds);
        context.read<InfoTileBloc>().add(const InfoTileEvent.toggleExpansion());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoTileBloc, InfoTileState>(
      builder: (context, state) {
        return _buildInfoTile();
      },
    );
  }

  Widget _buildInfoTile() {
    final InfoTileProps currentStateProps =
        context.read<InfoTileBloc>().state.infoTileProps;

    if (currentStateProps.isAbleToExpand == false &&
        currentStateProps.isExpanded == false) {
      _childrenHeightFactorController.playReverse(duration: 350.milliseconds);
    }

    return AnimatedBuilder(
        animation: _childrenHeightFactorController.view,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              top: 10,
              bottom: 10,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(16.0),
              color: _resolveStatusForBackgroundColor(),
              elevation: 4.0,
              shadowColor: Theme.of(context).backgroundColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () {
                  bool _isAbleToExpand = context
                      .read<InfoTileBloc>()
                      .state
                      .infoTileProps
                      .isAbleToExpand;
                  if (_isAbleToExpand) {
                    _handleTap();
                  } else {
                    return;
                  }
                },
                child: Ink(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: _horizontalLeadingPadding.value,
                              right: _horizontalLeadingPadding.value,
                              top: _topLeadingPadding.value,
                            ),
                            alignment: Alignment.centerLeft,
                            height: 54,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  readProps(context).leadingText,
                                  style:
                                      appTextTheme(context).headline5!.copyWith(
                                            fontSize: _fontSize.value,
                                            color: _resolveStatusForTextColor(),
                                          ),
                                ),
                                AnimatedSwitcher(
                                    duration: 10.milliseconds,
                                    child: context
                                            .read<InfoTileBloc>()
                                            .state
                                            .infoTileProps
                                            .isAbleToExpand
                                        ? _buildIcon()
                                        : _buildEmptySpace())
                              ],
                            ),
                          ),
                          ClipRect(
                            child: Align(
                              heightFactor: _childrenHeightFactor.value,
                              child: Opacity(
                                opacity: _opacity.value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 24,
                                    right: 24,
                                    bottom: 24,
                                  ),
                                  child: child,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
          );
        },
        child: readProps(context).child);
  }

  Color _resolveStatusForBackgroundColor() {
    switch (readProps(context).currentStatus) {
      case InfoTileStatus.loading:
        {
          return Theme.of(context).dialogBackgroundColor;
        }
      case InfoTileStatus.success:
        {
          return kcSuccessGreenBackground;
        }
      case InfoTileStatus.error:
        {
          return kcErrorRedBackground;
        }
    }
  }

  Color _resolveStatusForTextColor() {
    switch (readProps(context).currentStatus) {
      case InfoTileStatus.loading:
        {
          return kcBackgroundColorDark;
        }
      case InfoTileStatus.success:
        {
          return kcSuccessGreenText;
        }
      case InfoTileStatus.error:
        {
          return kcErrorRedText;
        }
    }
  }

  Widget _buildIcon() {
    return Transform.rotate(
      angle: _iconRotation.value,
      child: const Icon(
        Icons.expand_more,
        color: kcBackgroundColorDark,
      ),
    );
  }

  Widget _buildEmptySpace() {
    return const SizedBox.shrink();
  }
}
