import 'package:api_calling_2025/GetApi/api_services.dart';
import 'package:flutter/material.dart';



class ScreenWithoutModelList extends StatefulWidget {
  const ScreenWithoutModelList({super.key});

  @override
  State<ScreenWithoutModelList> createState() => _ScreenWithoutModelListState();
}

class _ScreenWithoutModelListState extends State<ScreenWithoutModelList> {
  bool isReady = false;
  List<dynamic> data = [];
  _getPostWitohutModelList() {
    isReady = true;
    ApiServices().getListWithoutModel().then((value) {
      data = value!;
      isReady = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    _getPostWitohutModelList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List API Without Model"),
        centerTitle: true,
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(data[index]['id'].toString()),
                    title: Text(data[index]['title'].toString()),
                    subtitle: Text(data[index]['body'].toString()),
                  ),
                );
              },
            ),
    );
  }
}
