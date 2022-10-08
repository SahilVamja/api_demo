import 'package:api_demo/Model/data_model.dart';
import 'package:api_demo/api.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data")),
      body: FutureBuilder<DataResponse>(
        future: listOfList(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [Text(snapshot.data!.data![index].id.toString()),
                  Text(snapshot.data!.data![index].title.toString())],
                );
              },
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
