import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/view/completion_screen.dart';
import 'package:tower_meal/common/view/completion_screen_to_email_login.dart';
import 'package:tower_meal/common/view/root_tab.dart';
import 'package:tower_meal/common/view/splash_screen.dart';
import 'package:tower_meal/home/view/home_screen.dart';
import 'package:tower_meal/mall/view/mall_screen.dart';
import 'package:tower_meal/product/view/product_screen.dart';
import 'package:tower_meal/user/view/certification_screen.dart';
import 'package:tower_meal/user/view/custom_sns_screen.dart';
import 'package:tower_meal/user/view/email_login_screen.dart';
import 'package:tower_meal/user/view/find_id_screen.dart';
import 'package:tower_meal/user/view/find_password_input_screen.dart';
import 'package:tower_meal/user/view/find_password_screen.dart';
import 'package:tower_meal/user/view/input_info_screen.dart';
import 'package:tower_meal/user/view/login_screen.dart';
import 'package:tower_meal/user/view/term_detail_screen.dart';
import 'package:tower_meal/user/view/term_screen.dart';

import '../../user/view/profile_screen.dart';
import '../view/error_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: null,
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) {
          final parameters = GoRouterState.of(context).pathParameters;

          return CompletionScreen(title: parameters['title']!);
        },
      ),
      GoRoute(
        path: '/completion_find/:title',
        name: CompletionScreenToEmailLogin.routeName,
        builder: (context, state) {
          final parameters = GoRouterState.of(context).pathParameters;

          return CompletionScreenToEmailLogin(title: parameters['title']!);
        },
      ),
      GoRoute(
        path: '/sns/:title',
        name: CustomSnsScreen.routeName,
        builder: (context, state) => CustomSnsScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'email_login',
            name: EmailLoginScreen.routeName,
            builder: (context, state) => EmailLoginScreen(),
            routes: [
              GoRoute(
                path: 'term',
                name: TermScreen.routeName,
                builder: (context, state) => TermScreen(),
                routes: [
                  GoRoute(
                    path: 'detail/:id',
                    name: TermDetailScreen.routeName,
                    builder: (context, state) => TermDetailScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'certification',
                name: CertificationScreen.routeName,
                builder: (context, state) => CertificationScreen(),
                routes: [
                  GoRoute(
                    path: 'input_info',
                    name: InputInfoScreen.routeName,
                    builder: (context, state) => InputInfoScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'find_id',
                name: FindIdScreen.routeName,
                builder: (context, state) => FindIdScreen(),
              ),
              GoRoute(
                path: 'find_password',
                name: FindPasswordScreen.routeName,
                builder: (context, state) => FindPasswordScreen(),
                routes: [
                  GoRoute(
                    path: 'input',
                    name: FindPasswordInputScreen.routeName,
                    builder: (context, state) => FindPasswordInputScreen(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return RootTab(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: HomeScreen.routeName,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: '/mall',
            name: MallScreen.routeName,
            builder: (context, state) => MallScreen(),
          ),
          GoRoute(
            path: '/product',
            name: ProductScreen.routeName,
            builder: (context, state) => ProductScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: ProfileScreen.routeName,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),
    ];
