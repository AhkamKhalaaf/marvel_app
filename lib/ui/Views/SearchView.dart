import 'package:flutter/material.dart';
import 'package:marvel_app/Widgets/SearchresultWidget.dart';
import 'package:marvel_app/models/Charctermodel.dart';
import 'package:marvel_app/scopedmodels/CharcterScopedmodel.dart';
import 'package:marvel_app/ui/publicwidget/Base_View.dart';

class SearchView extends StatefulWidget {
  static const routname = 'searchview';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Searchstate();
  }
}

class Searchstate extends State<SearchView> {
  bool visiblewidget =false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Base_view<Charcterscopmodel>(
        builder: (context, child, model) => SafeArea(
                child: Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.black,
                title: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      margin:
                          EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                      child: Center(
                        child: TextFormField(
                          onFieldSubmitted: (_) {
                            model.Fecthcdata();
                            setState(() {
                              visiblewidget=true;
                            });
                          },
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.text,
                          minLines: 1,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12.0),
                              hintText: '.. search',
                              hintStyle:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5.0)),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                    )),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 16.0, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              body: Container(width: double.infinity,height: double.infinity,color: Colors.grey,child: Visibility(visible: visiblewidget,child: FutureBuilder(
                future: model.DataList,
                builder: (context, snapdata) {
                  if (snapdata.hasData) {
                    List<CharcterModel> DataListcharcters = snapdata.data;
                    if (DataListcharcters.length > 0) {
                      return ListView.builder(
                          itemCount: DataListcharcters.length,
                          itemBuilder: (context, index) {
                            return SearchItemWidget(
                              fullUrl: DataListcharcters[index].thumbnail.path +
                                  '.' +
                                  DataListcharcters[index].thumbnail.extension,
                              namecharacter: DataListcharcters[index].name,
                              Description: DataListcharcters[index].description,
                              Itemscomics:
                              DataListcharcters[index].comics.items,
                              ItemSeries: DataListcharcters[index].series.items,
                              ItemStoereies:
                              DataListcharcters[index].stories.items,
                              ItemEvents: DataListcharcters[index].events.items,
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
                    child:
                    CircularProgressIndicator(backgroundColor: Colors.red),
                  );
                },
              )),),
            )));
  }
}
