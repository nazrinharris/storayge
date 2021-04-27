import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:storayge/app/app.locator.dart';
import 'package:storayge/app/app.router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final String logoPath = 'assets/images/svg/storayge_logo.svg';

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
