import 'package:api_calling_2025/GetApi/api_services.dart';
import 'package:flutter/material.dart';

class MultidataScreenWithoutModel extends StatefulWidget {
  const MultidataScreenWithoutModel({super.key});

  @override
  State<MultidataScreenWithoutModel> createState() =>
      _MultidataScreenWithoutModelState();
}

class _MultidataScreenWithoutModelState
    extends State<MultidataScreenWithoutModel> {
  dynamic Data;

  bool isReady = false;
  _getMultiDatWithoutModel() {
    isReady = true;
    ApiServices().getMultiDataWithoutModel().then((value) {
      Data = value!;
      isReady = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    _getMultiDatWithoutModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" MultiData Api "),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Data['page'].toString()),
          Text(Data['total'].toString()),
          Text(Data['total_pages'].toString()),
          Expanded(
            child: ListView.builder(
              itemCount: Data.length,
              itemBuilder: (context, index) {
                return Card(child: ListTile(
                  leading: Text(Data['data'][index]['id'].toString()),
                  title: Text(Data['data'][index]['name']),
                  subtitle: Text(Data['data'][index]['color']),
                ),);
              
              
            },),
          )
        ],
      ),
    );
  }
}
