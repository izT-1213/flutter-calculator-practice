import 'package:flutter/material.dart';
import 'package:bloc_example2/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late CounterCubit cubit;
  
  void navigateToOperationPage(BuildContext context, String function/*, int value, String userInput*/){
    if (function == 'Multiply'){
    Navigator.pushNamed(context, '/operationPageMultiply', arguments: {function/*, value, userInput*/});
    } else{
      Navigator.pushNamed(context, '/operationPageDivision', arguments: {function/*, value, userInput*/});
    }
    }

  final userInput = TextEditingController();

  @override
  void didChangeDependencies() {
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<CounterCubit, int>(
        bloc: cubit,
        listener: (context, state) {
          final snackbar = SnackBar(
            content: Text(
              'State reached for $state times.',
              textAlign: TextAlign.center,
            ),
          );
          if (state % 5 == 0) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: userInput,
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter value',
                  ),
                )),
                Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lime,
                          minimumSize: const Size(80, 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      onPressed: () {
                        cubit.incrementCounter();
                      },
                      child: const Text("ADD +1"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                          minimumSize: const Size(80, 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      onPressed: () {
                        cubit.decrementCounter();
                      },
                      child: const Text("MINUS -1"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(80, 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        onPressed: () {
                          cubit.reset();
                        },
                        child: const Text('RESET =0'))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                            minimumSize: const Size(80, 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        onPressed: () {
                          navigateToOperationPage(context, 'Multiply'/*, state, userInput.text*/);
                        },
                        child: const Text('MULTIPLY')),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          minimumSize: const Size(80, 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      onPressed: () {
                      navigateToOperationPage(context, 'Division'/*, state, userInput.text*/);
                      },
                        child: const Text('DIVISION')),
              ],
            ),
          ]
          ));
          },
      ),
    );
  }
}
