part of 'primary_button_aware_cubit.dart';

class PrimaryButtonAware extends StatelessWidget {
  final Icon firstPageButtonIcon;
  final String firstPageContent;
  final Function() firstPageOnPressed;
  final Icon secondPageButtonIcon;
  final String secondPageContent;
  final Function() secondPageOnPressed;
  final Icon? thirdPageButtonIcon;
  final String? thirdPageContent;
  final Function()? thirdPageOnPressed;
  final double width;

  const PrimaryButtonAware({
    Key? key,
    required this.firstPageButtonIcon,
    required this.firstPageContent,
    required this.firstPageOnPressed,
    required this.secondPageButtonIcon,
    required this.secondPageContent,
    required this.secondPageOnPressed,
    this.thirdPageButtonIcon,
    this.thirdPageContent,
    this.thirdPageOnPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryButtonAwareCubit, PrimaryButtonAwareState>(
      builder: (context, state) {
        Function()? activeOnPressed = firstPageOnPressed;
        bool isLoading = false;

        if (state == _stateLoading) {
          isLoading = true;
          activeOnPressed = null;
        } else if (state == _stateInitialPage) {
          isLoading = false;
          activeOnPressed = firstPageOnPressed;
        } else if (state == _stateSecondPage) {
          isLoading = false;
          activeOnPressed = secondPageOnPressed;
        } else if (state == _stateThirdPage) {
          isLoading = false;
          activeOnPressed = thirdPageOnPressed;
        }

        // if (state is AuthIdle) {
        //   if (context.read<RegisterViewCubit>().state
        //       is RegisterViewSecondPage) {
        //     activeOnPressed = secondPageOnPressed;
        //   } else {
        //     activeOnPressed = firstPageOnPressed;
        //   }
        //   isLoading = false;
        // } else if (state is AuthLoading) {
        //   activeOnPressed = null;
        //   isLoading = true;
        // } else if (state is AuthGeneralCompleted) {
        //   activeOnPressed = () {};
        //   isLoading = false;
        //   context.read<TwoPaginationProgressCubit>().triggerSecondPage();
        //   context.read<RegisterViewCubit>().triggerSecondPage();
        //   context.read<AuthCubit>().emitIdle();
        // } else {
        //   activeOnPressed = firstPageOnPressed;
        //   isLoading = false;
        // }

        return ElevatedButton(
          onPressed: activeOnPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          child: SizedBox(
            width: width,
            height: 46,
            child: AnimatedSwitcher(
              duration: 500.milliseconds,
              child: isLoading
                  ? _buildLoading(context)
                  : _buildNormalButtonContent(
                      context.watch<PrimaryButtonAwareCubit>().state, context),
            ),
          ),
        );
      },
    );
  }

  AnimatedSwitcher _buildNormalButtonContent(
      PrimaryButtonAwareState state, BuildContext context) {
    Widget contentWidget;

    if (state == _stateInitialPage) {
      contentWidget = _buildFirstPageButtonContent(context);
    } else if (state == _stateSecondPage) {
      contentWidget = _buildSecondPageButtonContent(context);
    } else if (state == _stateThirdPage) {
      contentWidget = _buildThirdPageButtonContent(context);
    } else {
      contentWidget = const Text('Unknown Error');
    }

    return AnimatedSwitcher(
      duration: 250.milliseconds,
      child: contentWidget,
    );
  }

  Row _buildFirstPageButtonContent(BuildContext context) {
    return Row(
      key: const Key('build_first_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstPageContent,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        horizontalSpace14,
        firstPageButtonIcon,
      ],
    );
  }

  Row _buildSecondPageButtonContent(BuildContext context) {
    return Row(
      key: const Key('build_second_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          secondPageContent,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        horizontalSpace5,
        secondPageButtonIcon,
      ],
    );
  }

  Row _buildThirdPageButtonContent(BuildContext context) {
    return Row(
      key: const Key('build_third_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          thirdPageContent!,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        horizontalSpace5,
        thirdPageButtonIcon!,
      ],
    );
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
