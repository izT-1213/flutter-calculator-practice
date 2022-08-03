import 'package:bloc_example2/calculator_params.dart';
import 'package:bloc_example2/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: BlocProvider(
          create: (context) => CounterCubit(),
          child: const MyHomePage(title: 'Calculator')),
        routes: {
          '/operationPageMultiply': (context) => CalculatorParams(),
          '/operationPageDivision': (context) => CalculatorParams(),
          '/homepage': (context) => MyHomePage(title: 'Calculator')
        }
    );
  }
}