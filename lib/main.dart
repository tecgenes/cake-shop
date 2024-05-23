import 'package:cake_shop/core/dependencies/dependencies.dart';
import 'package:cake_shop/core/router/app_router.dart';
import 'package:cake_shop/core/theme/appearances/defult_appearance.dart';
import 'package:cake_shop/features/account/presentation/manager/theme/theme_mode_cubit.dart';
import 'package:cake_shop/features/auth/presentation/manager/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('ar'),
      useOnlyLangCode: true,
      child: const CakeShop(),
    ),
  );
}

class CakeShop extends StatelessWidget {
  const CakeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeModeCubit()),
        BlocProvider(create: (_) => dependency<AuthBloc>()),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: dependency.call<AppRouter>().config(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: themeMode,
            theme: DefultAppearance.light,
            darkTheme: DefultAppearance.dark,
          );
        },
      ),
    );
  }
}
