import 'package:pragnancy_app/bloc/localization/localization_bloc.dart';
import 'package:pragnancy_app/bloc/localization/localization_event.dart';
import 'package:pragnancy_app/comman/routes/names.dart';
import 'package:pragnancy_app/view/getStart/screen/get_start.dart';
import 'routes.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        path: AppRoutes.HOME,
        page: HomeScreen(),
        bloc: BlocProvider(
          create: (context) => LocalizationBloc()
            ..add(LoadLocalization(SessionManager.getLanguage() ?? 'hi')),
        ),
      ),
    ];
  }

  static List<dynamic> blocer(BuildContext context) {
    List<dynamic> blocerList = <dynamic>[];
    for (var blocer in routes()) {
      blocerList.add(blocer.bloc);
    }
    return blocerList;
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) =>
            SessionManager.getToken() == null ? GetStartScreen() : HomeScreen(),
        settings: settings);
  }
}

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;
  PageEntity({required this.path, required this.page, this.bloc});
}
