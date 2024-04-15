import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/core/app_colors.dart';
import 'package:news_test_app/presentation/home/bloc/home_bloc.dart';
import 'package:news_test_app/presentation/home/home_screen.dart';
import 'package:news_test_app/service_locator.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Test App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mainBackground,
        fontFamily: "SFPro",
      ),
      home: BlocProvider(
        create: ((context) => sl<HomeBloc>()),
        child: const HomeScreen(),
      ),
    );
  }
}
