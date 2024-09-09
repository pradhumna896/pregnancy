import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/bloc/localization/localization_bloc.dart';
import 'package:pragnancy_app/bloc/localization/localization_event.dart';
import 'package:pragnancy_app/bloc/localization/localization_state.dart';
import 'package:pragnancy_app/comman/routes/pages.dart';
import 'package:pragnancy_app/core/constants/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://demo5.nrt.co.in/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${SessionManager.getToken()}',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(
      client: client,
    ));
  });
}

class MyApp extends StatefulWidget {
  final ValueNotifier<GraphQLClient>? client;
  const MyApp({super.key, this.client});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        child: MultiBlocProvider(
          providers: [...AppPages.blocer(context)],
          child: BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                onGenerateRoute: AppPages.generateRouteSetting,
              );
            },
          ),
        ),
      ),
    );
  }
}

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: context.read<LocalizationBloc>().state.locale,
      onChanged: (String? newValue) {
        if (newValue != null) {
          context.read<LocalizationBloc>().add(LoadLocalization(newValue));
        }
      },
      items: <String>['en', 'hi'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.toUpperCase()),
        );
      }).toList(),
    );
  }
}
