part of 'primary_button_aware_cubit.dart';

enum PrimaryButtonAwareType { onePage, twoPage, threePage }

/// Guide on using [PrimaryButtonAware]
///
/// This widget is basically an [ElevatedButton] which is somewhat aware of the state of the screen.
/// It's structure (aside from the state awareness) should and must follow [PrimaryButton] - [Storayge]
/// Note : Although this widget is named 'aware', the awareness of it must be set by another
/// presentation logic controller.
///
/// REMEMBER :- Provide the [PrimaryButtonAwareCubit] to one of it's ancestors. Use [Builder] if
/// you can't access the cubit eventhough it has been provided.
///
/// It's state change is done through the use of it's public methods :
///
/// [triggerLoading()]
/// Call this method when you want to update the button's state to loading.
///
/// [triggerFirstPage()]
/// Call this method when you want to update the button's state to what you have
/// set for the first page.
///
/// [triggerSecondPage()]
/// By now you should now what this does.
///
/// [triggerThirdPage()]
/// Same with this.
///
/// By default, you must provide the arguments for the first and second pages. This widget currently
/// supports up to three pages, but newer versions may be made to support even more pages.
///
/// Caution! : If you are not utilising [triggerThirdPage] do NOT use it at all. Unnecesarry calls
/// on the method will at best, cause unexpected behaviour and at worst, crash the app. Tbh i never tried.
///
/// Upon it's creation, this cubit will emit [_stateInitialPage]
///
/// [states] of this button should not be listened to or taken notice of. This widget's state
/// should depend on an outside source.
///
/// TODO: Implement thirdPageButton feature
/// TODO: Implement tests. If possible
class PrimaryButtonAware extends StatelessWidget {
  final Icon? firstPageButtonIcon;
  final String firstPageContent;
  final Function() firstPageOnPressed;
  final Icon? secondPageButtonIcon;
  final String? secondPageContent;
  final Function()? secondPageOnPressed;
  final Icon? thirdPageButtonIcon;
  final String? thirdPageContent;
  final Function()? thirdPageOnPressed;
  final double width;
  final PrimaryButtonAwareType type;
  final EdgeInsets? padding;
  final double? borderRadius;

  const PrimaryButtonAware({
    Key? key,
    required this.firstPageContent,
    required this.firstPageOnPressed,
    required this.type,
    this.firstPageButtonIcon,
    this.secondPageButtonIcon,
    this.secondPageContent,
    this.secondPageOnPressed,
    this.thirdPageButtonIcon,
    this.thirdPageContent,
    this.thirdPageOnPressed,
    this.padding,
    this.borderRadius,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryButtonAwareCubit, PrimaryButtonAwareState>(
      builder: (context, state) {
        bool isLoading = false;

        if (state == _stateLoading) {
          isLoading = true;
        } else if (state == _stateInitialPage) {
          isLoading = false;
        } else if (state == _stateSecondPage) {
          isLoading = false;
        } else if (state == _stateThirdPage) {
          isLoading = false;
        }

        return ElevatedButton(
          onPressed: _resolveOnPressed(context),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
              ),
            ),
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(0),
            child: SizedBox(
              width: width,
              height: 46,
              child: AnimatedSwitcher(
                duration: 500.milliseconds,
                child: isLoading
                    ? _buildLoading(context)
                    : _buildNormalButtonContent(
                        context.watch<PrimaryButtonAwareCubit>().state,
                        context),
              ),
            ),
          ),
        );
      },
    );
  }

  Function()? _resolveOnPressed(BuildContext context) {
    final PrimaryButtonAwareState state =
        context.read<PrimaryButtonAwareCubit>().state;
    final PrimaryButtonAwareType currentType = type;

    switch (currentType) {
      case PrimaryButtonAwareType.onePage:
        if (state == _stateLoading) {
          return null;
        } else if (state == _stateInitialPage) {
          return firstPageOnPressed;
        }
        break;
      case PrimaryButtonAwareType.twoPage:
        // ignore: invariant_booleans
        if (state == _stateLoading) {
          return null;
        } else if (state == _stateInitialPage) {
          return firstPageOnPressed;
        } else if (state == _stateSecondPage) {
          return secondPageOnPressed;
        }
        break;
      case PrimaryButtonAwareType.threePage:
        // ignore: invariant_booleans
        if (state == _stateLoading) {
          return null;
        } else if (state == _stateInitialPage) {
          return firstPageOnPressed;
        } else if (state == _stateSecondPage) {
          return secondPageOnPressed;
        } else if (state == _stateThirdPage) {
          return thirdPageOnPressed;
        }
        break;
    }
  }

  AnimatedSwitcher _buildNormalButtonContent(
      PrimaryButtonAwareState state, BuildContext context) {
    Widget contentWidget;

    if (state == _stateInitialPage) {
      contentWidget = _resolveIconOrNot(
        context: context,
        child: Text(
          firstPageContent,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        buttonIcon: firstPageButtonIcon,
      );
    } else if (state == _stateSecondPage) {
      contentWidget = _resolveIconOrNot(
        context: context,
        child: Text(
          secondPageContent!,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        buttonIcon: secondPageButtonIcon,
      );
    } else if (state == _stateThirdPage) {
      contentWidget = _resolveIconOrNot(
        context: context,
        child: Text(
          thirdPageContent!,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        buttonIcon: thirdPageButtonIcon,
      );
    } else {
      contentWidget = const Text('Unknown Error');
    }

    return AnimatedSwitcher(
      duration: 250.milliseconds,
      child: contentWidget,
    );
  }

  Widget _resolveIconOrNot({
    required BuildContext context,
    required Widget child,
    required Icon? buttonIcon,
  }) {
    if (buttonIcon == null) {
      return Container(alignment: Alignment.center, child: child);
    } else {
      return Row(
        key: Key('build_${child.toString()}_content'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          horizontalSpace14,
          firstPageButtonIcon!,
        ],
      );
    }
  }

  Widget _buildLoading(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.7,
        color: Theme.of(context).indicatorColor,
      ),
    );
  }
}
