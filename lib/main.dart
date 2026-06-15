import 'package:clean_arch_test/core/database/cache/cache_helper.dart';
import 'package:clean_arch_test/core/utils/service_locator.dart';
import 'package:clean_arch_test/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_arch_test/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(4),
        child: const UserScreen(),
      ),
    );
  }
}
