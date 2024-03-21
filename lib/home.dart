import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_state_management/list_provider.dart';
import 'package:providers_state_management/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder:((context, numbersProviderModel, child) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          numbersProviderModel.add();
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
            Text(numbersProviderModel.numbers.last.toString(), style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            Expanded(
              child: ListView.builder(
                  itemCount: numbersProviderModel.numbers.length,
                  itemBuilder: (context, index){
                    return Text(numbersProviderModel.numbers[index].toString() ,  style: const TextStyle(
                        fontSize: 30,
                    ),);
                  }
              ),
            ),
            ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Second()));
            }, child: const Text("Submit"))
          ],
        )
      ))
    );
  }
}
