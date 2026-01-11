import 'package:fintech_app/core/cache/cache_helper.dart';
import 'package:fintech_app/core/cache/hive_adapters.dart';
import 'package:fintech_app/core/di/dependency_injection.dart';
import 'package:fintech_app/core/helpers/shared_pref.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/fintech_app.dart';
import 'package:fintech_app/firebase_options.dart';
import 'package:fintech_app/my_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables
  await dotenv.load(fileName: '.env');

  // IMPORTANT: Register Hive type adapters FIRST (before opening box)
  HiveAdapters.registerAdapters();

  // Then initialize Hive cache (opens the box)
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize dependency injection
  await initGetIt();

  // Initialize Stripe with env key
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  final sharedPref = await SharedPref.getInstance();
  final isLoggedIn = sharedPref.isLoggedIn() && sharedPref.getUserId() != null;
  final initialRoute = isLoggedIn ? Routes.homeScreen : Routes.onboardingScreen;
  final initialRouteArguments = isLoggedIn
      ? (sharedPref.getUserName() ?? 'User')
      : null;

  runApp(
    FintechApp(
      appRouter: AppRouter(),
      initialRoute: initialRoute,
      initialRouteArguments: initialRouteArguments,
    ),
  );
}
