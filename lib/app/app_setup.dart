import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/screens/splash_screen/splash_screen.dart';



@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
  //   MaterialRoute(page: OnboardingScreen),
  //   MaterialRoute(page: SigninScreen),
  //   MaterialRoute(page: SignupScreen),
  //   MaterialRoute(page: GetStartedPage),
  //   MaterialRoute(page: DashboardView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
  ],
  logger: StackedLogger(),
)
class $AppSetup {}