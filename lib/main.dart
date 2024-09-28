import 'package:everyting_test/animations/animated_container.dart';
import 'package:everyting_test/animations/animation_2.dart';
import 'package:everyting_test/animations/animation_3.dart';
import 'package:everyting_test/avatar_glow/avatar_glow_screen.dart';
import 'package:everyting_test/local_auth/local_auth_screen.dart';
import 'package:everyting_test/routes/route_screen.dart';
import 'package:everyting_test/routes/routes.dart';
import 'package:everyting_test/shimmer/shimmer_effect.dart';
import 'package:everyting_test/test%20app/test_app.dart';
import 'package:everyting_test/widgets/animated_progress_indicator.dart';
import 'package:everyting_test/widgets/expansion_panel_list.dart';
import 'package:everyting_test/widgets/hero_animations.dart';
import 'package:everyting_test/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => RouteScreen(),
      ),
      GoRoute(
        path: '/next-screen',
        builder: (context, state) => NextPage(),
      ),
    ]);

    return MaterialApp(
      // onGenerateRoute: Routes.generateRoute,
      // initialRoute: Routes.secondPage,
      home: ShimmerEffect(),
    );
  }
}
