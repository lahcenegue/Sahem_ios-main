
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahem/bloc/app_cubit.dart';
import 'package:sahem/screen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
      create: (_)=>AppCubit()..getDateProfile()..getEmpTasks()..getTasks()..getMosques()..getReports(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sahem',
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
