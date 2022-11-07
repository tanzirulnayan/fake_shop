import 'package:fake_shop/features/home/bloc/home_bloc.dart';
import 'package:fake_shop/features/home/view/home_page.dart';
import 'package:fake_shop/features/login/bloc/login_bloc.dart';
import 'package:fake_shop/features/login/view/login_page.dart';
import 'package:fake_shop/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:fake_shop/features/sign_up/view/sign_up_page.dart';
import 'package:fake_shop/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );

    return MaterialApp(
      title: 'Fake Shop',
      theme: ThemeData(
        primaryColor: const Color(0xFF034ea1),
        secondaryHeaderColor: const Color(0xFF045fc8),
        scaffoldBackgroundColor: const Color(0xFFf8f9fd),
        canvasColor: const Color(0xFFffffff),
        cardColor: const Color(0xFFffffff),
        shadowColor: const Color(0xFFced4da),
        errorColor: const Color(0xFFdc3545),
        backgroundColor: const Color(0xFFf2f7ff),
        visualDensity: VisualDensity.compact,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF034ea1),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        fontFamily: 'Myriad',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212b46),
          ),
          headline2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color(0xFF212b46),
          ),
          headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212b46),
          ),
          headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFF212b46),
          ),
          headline5: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFF212b46),
          ),
          headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFFffffff),
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFF6c757d),
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFF6c757d),
          ),
          caption: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFF6c757d),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
      routes: {
        LoginPage.routeName: (ctx) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginPage(),
            ),
        SignUpPage.routeName: (ctx) => BlocProvider(
              create: (context) => SignUpBloc(),
              child: const SignUpPage(),
            ),
        HomePage.routeName: (ctx) => BlocProvider(
              create: (context) => HomeBloc(),
              child: const HomePage(),
            ),
      },
    );
  }
}
