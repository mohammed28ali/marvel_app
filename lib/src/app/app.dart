import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/app/services_locator.dart';
import 'package:marvel_app/src/config/app_theme/app_theme.dart';
import '../config/router/app_routes.dart';
import '../layers/auth/presentation/cubit/auth_cubit.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthCubit>()..signUpUseCase,
        ),
        BlocProvider(
          create: (context) => serviceLocator<AuthCubit>()..signInUseCase,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        onGenerateRoute: AppRoutes.generatePageRoute,
        initialRoute: AppRoutesStrings.loginScreenRoute,
      ),
    );
  }
}
