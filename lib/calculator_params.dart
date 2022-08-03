import 'package:flutter/material.dart';

import 'operation_page.dart';

class CalculatorParams extends StatelessWidget {
  const CalculatorParams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as int;
    final user = ModalRoute.of(context)!.settings.arguments as String;
    final mode = ModalRoute.of(context)!.settings.arguments as String;
    return OperationPage(
      state: data,
      userInput: user,
      function: mode,
    );
  }
}
