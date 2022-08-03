import 'package:flutter/material.dart';

class OperationPage extends StatefulWidget {

  final String function, userInput;
  final int state;

  const OperationPage({Key? key, required this.function, required this.state, required this.userInput}) : super(key: key);

  @override
  State<OperationPage> createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  get state => null;

  void navigateBack(BuildContext context){
    Navigator.pushNamed(context, '/homePage');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculate")),
      body:Container(color: Colors.purple,
      child: Column(
        children: [
          Text('$state')
        ],
      ),)
    );
  }
}

