import 'package:get/get.dart';
import 'package:listoftodo/View/Home.dart';
import 'package:listoftodo/View/Todo_Details.dart';

// App Route Function
appRoutes() => [
      GetPage(
        name: '/home',
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/todoDetailsPage',
        page: () => TodoDetailsPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class MyGetMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
