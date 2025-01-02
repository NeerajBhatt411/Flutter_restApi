import 'package:api_calling_2025/api/api_services.dart';
import 'package:api_calling_2025/model/multidata_complex_api.dart';
import 'package:flutter/material.dart';

class MultidataScreenWithModel extends StatefulWidget {
  const MultidataScreenWithModel({super.key});

  @override
  State<MultidataScreenWithModel> createState() =>
      _MultidataScreenWithModelState();
}

class _MultidataScreenWithModelState extends State<MultidataScreenWithModel> {
  bool isReady = false;
  MultiData data = MultiData();
  _getMultiData() {
    isReady = true;
    ApiServices().getMultiDataWithModel().then((value) {
      setState(() {
        data = value!;
        isReady = false;
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    _getMultiData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiData API"),
        centerTitle: true,
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(data.page.toString()),
                Text(data.perPage.toString()),
                Text(data.total.toString()),
                Text(data.totalPages.toString()),
                Text(data.support!.text.toString()),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(data.data![index].id.toString()),
                          title: Text(data.data![index].name.toString()),
                          subtitle: Text(data.data![index].year.toString()),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
