// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../features/auth/sign_in/sign_in_page.dart';
// import '../features/home/home_page.dart';

// GoRouter buildRouter(
//   BuildContext context,
// ) =>
//     GoRouter(
//       initialLocation: SignInPage.route.path,
//       routes: [
//         GoRoute(
//           path: HomePage.route.path,
//           builder: (context, state) => const HomePage(),
//         ),
//         GoRoute(
//           path: SignInPage.route.path,
//           builder: (context, state) => const SignInPage(),
//         ),
//         // GoRoute(
//         //   path: IntroScreen.route.path,
//         //   builder: (context, state) => const IntroScreen(),
//         // ),
//         // GoRoute(
//         //   path: AuthScreen.route.path,
//         //   builder: (context, state) => const AuthScreen(),
//         //   routes: [
//         //     GoRoute(
//         //       path: EmailConfirmationScreen.route.path,
//         //       builder: (context, state) {
//         //         final params = state.extra as ConfirmationParams;
//         //         // assert(params.email != null);

//         //         // return EmailConfirmationScreen(params: params);
//         //         return EmailConfirmationScreen(params: params);
//         //       },
//         //     ),
//         //     GoRoute(
//         //       path: PhoneConfirmationScreen.route.path,
//         //       builder: (context, state) {
//         //         final params = state.extra as ConfirmationParams;
//         //         assert(params.phone != null);

//         //         return PhoneConfirmationScreen(params: params);
//         //       },
//         //     ),
//         //   ],
//         // ),
//         // GoRoute(
//         //   path: MainScreen.route.path,
//         //   builder: (context, state) => const MainScreen(),
//         //   routes: [
//         //     GoRoute(
//         //         path: PostDetailsScreen.route.path,
//         //         builder: (context, state) {
//         //           final id = int.parse(state.params['id']!);
//         //           return PostDetailsScreen(id: id);
//         //         }),
//         //     GoRoute(
//         //       path: CategoriesListScreen.route.path,
//         //       builder: (context, state) => const CategoriesListScreen(),
//         //     ),
//         //     GoRoute(
//         //       path: CreatePostScreen.route.path,
//         //       builder: (context, state) => const CreatePostScreen(),
//         //     ),
//         //     GoRoute(
//         //       path: ResumeEditScreen.route.path,
//         //       builder: (context, state) => const ResumeEditScreen(),
//         //     ),
//         //     GoRoute(
//         //       path: CreatePostScreen.route.path,
//         //       builder: (context, state) => const CreateVacancyScreen(),
//         //     ),
//         //     GoRoute(
//         //       path: CreatePostScreen.route.path,
//         //       builder: (context, state) => const RateScreenWrapper(),
//         //     ),
//         //   ],
//         // ),
//       ],
//       errorBuilder: (context, state) => Scaffold(
//         body: Center(
//           child: Text('Route not found ${state.location}'),
//         ),
//       ),
//     );

// // get routeInformationParser => _router.routeInformationParser;
// // get routerDelegate => _router.routerDelegate;
// // get routeInformationProvider => _router.routeInformationProvider;
