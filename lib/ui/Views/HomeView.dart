import 'package:flutter/material.dart';
import 'package:marvel_app/Locator_service.dart';
import 'package:marvel_app/Widgets/CharcterWidget.dart';
import 'package:marvel_app/models/Charctermodel.dart';
import 'package:marvel_app/scopedmodels/CharcterScopedmodel.dart';
import 'package:marvel_app/ui/Views/SearchView.dart';
import 'package:marvel_app/ui/publicwidget/Base_View.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeVieww extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homestate();
  }
}

class Homestate extends State<HomeVieww> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((){
     if( _scrollController.position.pixels==_scrollController.position.maxScrollExtent)
       {
         print('dsdsdsd');
       }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Base_view<Charcterscopmodel>(
        onmodelRely: (model) => model.Fecthcdata(),
        builder: (context, child, model) => SafeArea(
                child: Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                backgroundColor: Colors.black,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 35.0,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SearchView.routname);
                      })
                ],
                title: Container(
                  color: Colors.red,
                  child: Text(
                    'Marvel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              body: FutureBuilder(
                  future: model.DataList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CharcterModel> Datalist = snapshot.data;
                      if (Datalist.length > 0) {
                        return ListView.builder(
                          controller: _scrollController,
                            itemCount: Datalist.length,
                            itemBuilder: (context, index) {
                              return CharchterWidget(
                                fullUrl: Datalist[index].thumbnail.path +
                                    '.' +
                                    Datalist[index].thumbnail.extension,
                                namecharacter: Datalist[index].name,
                              );
                            });
                      } else {
                        return Container(
                          child: Text(
                            'there is not data to show it',
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          ),
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.red),
                    );
                  }),
            )));
  }
}
