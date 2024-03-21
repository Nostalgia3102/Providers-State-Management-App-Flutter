import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_state_management/list_provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder:((context, numberListProvider, child) =>
            Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          numberListProvider.add();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Providers App", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white
        ),),
      ),
      body: Column(
          children: [
            Text(numberListProvider.numbers.last.toString(), style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: numberListProvider.numbers.length,
                  itemBuilder: (context, index){
                    return Text(numberListProvider.numbers[index].toString() ,  style: const TextStyle(
                      fontSize: 30,
                    ),);
                  }
              ),
            )
          ],
    ))));
  }
}
