import 'package:api_calling_2025/GetApi/api_services.dart';
import 'package:api_calling_2025/model/multiple_post_list_model.dart';
import 'package:flutter/material.dart';

class ScreenWithModelList extends StatefulWidget {
  const ScreenWithModelList({super.key});

  @override
  State<ScreenWithModelList> createState() => _ScreenWithModelListState();
}

class _ScreenWithModelListState extends State<ScreenWithModelList> {
  bool isReady = false;
  List<multiplePostList> data = [];
  _getPost(){
    isReady=true;
    ApiServices().getListWithModel().then((value){
      data= value!;
      isReady =false;
      setState(() {

        
      });
    });
  }
  @override
  void initState() {
    _getPost();
    // TODO: implement initState
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List API "),
        centerTitle: true,
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
             itemCount: data.length,
              itemBuilder: (context, index) {
               return Card(child: ListTile(
                 leading: Text(data[index].id.toString()),
                 title: Text(data[index].title.toString()),
                 subtitle: Text(data[index].body.toString()),
               ),);

              },
            ),
    );
  }
}
