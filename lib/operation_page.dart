import 'package:flutter/material.dart';

class OperationPage extends StatefulWidget {
  const OperationPage({Key? key}) : super(key: key);

  @override
  State<OperationPage> createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  void navigateBack(BuildContext context){
    Navigator.pushNamed(context, '/homePage');
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

