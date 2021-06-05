import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubit/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("count apps"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) => Text(
                (context.read<CounterCubit>().state == state
                    ? 'Angka saat ini : $state'
                    : 'Angka saat ini : ${context.read<CounterCubit>().state}'),
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => context.read<CounterCubit>().state > 0
                      ? context.read<CounterCubit>().decrement()
                      : {},
                  icon: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            ElevatedButton(
              child: Text('CATALOG'),
              onPressed: () {
                Navigator.pushNamed(context, '/catalog');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
