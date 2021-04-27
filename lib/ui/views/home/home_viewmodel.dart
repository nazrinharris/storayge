import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:storayge/app/app.locator.dart';
import 'package:storayge/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToStart() {
    _navigationService.navigateTo(Routes.startView);
  }
}
