import 'package:flutter/material.dart';
import 'package:marvel_app/Widgets/SectionWidget.dart';
import 'package:marvel_app/Widgets/TextDatawithWhitecolor.dart';
import 'package:marvel_app/Widgets/TextViewData.dart';
import 'package:marvel_app/models/Charctermodel.dart';

class DetailCharcter extends StatefulWidget {
  static const routname = 'detailcharacter';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Detailcharcterstate();
  }
}

class Detailcharcterstate extends State<DetailCharcter> {
  String namecharcter, descritioncharcter, imagepathcharcter;
  List<ComicsItem> Itemscomics, ItemSeries, ItemEvents;
  List<StoriesItem> ItemStoereies;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    namecharcter = Arguments['name'];
    descritioncharcter = Arguments['description'];
    imagepathcharcter = Arguments['pathimage'];
    Itemscomics = Arguments['comics'];
    ItemSeries = Arguments['series'];
    ItemStoereies = Arguments['stories'];
    ItemEvents = Arguments['events'];
    print(imagepathcharcter);
  }

  void ShowSectionDetaildailog(String imagepath, String namech) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return SafeArea(
              child: Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 40.0, top: 40.0),
                color: Colors.black87,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Expanded(
                        child: Image.network(
                          imagepath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          namech,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ]),
              ),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    imagepathcharcter,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300.0,
                  ),
                  Positioned(
                      child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
              Container(
                color: Colors.black87,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextData(Datashowed: 'NAME'),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextDataWhitecolor(
                      Datashowed: namecharcter,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextData(Datashowed: 'DESCRIPTION'),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextDataWhitecolor(
                      Datashowed: descritioncharcter,
                    ),
                    TextData(Datashowed: 'COMICS'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Visibility(
                      visible: Itemscomics.length > 0 ? true : false,
                      child: Container(
                        height: 160.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: Itemscomics.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ShowSectionDetaildailog(imagepathcharcter,
                                      Itemscomics[index].name);
                                },
                                child: ScotionWidget(
                                  name: Itemscomics[index].name,
                                  Imagepathsection: imagepathcharcter,
                                ),
                              );
                            }),
                      ),
                    ),
                    TextData(Datashowed: 'SERIES'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Visibility(
                      visible: ItemSeries.length > 0 ? true : false,
                      child: Container(
                        height: 150.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: ItemSeries.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ShowSectionDetaildailog(imagepathcharcter,
                                      ItemSeries[index].name);
                                },
                                child: ScotionWidget(
                                  name: ItemSeries[index].name,
                                  Imagepathsection: imagepathcharcter,
                                ),
                              );
                            }),
                      ),
                    ),
                    TextData(Datashowed: 'STORIES'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Visibility(
                      visible: ItemStoereies.length > 0 ? true : false,
                      child: Container(
                        height: 150.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: ItemStoereies.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ShowSectionDetaildailog(imagepathcharcter,
                                      ItemStoereies[index].name);
                                },
                                child: ScotionWidget(
                                  name: ItemStoereies[index].name,
                                  Imagepathsection: imagepathcharcter,
                                ),
                              );
                            }),
                      ),
                    ),
                    TextData(Datashowed: 'EVENTS'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Visibility(
                        visible: ItemEvents.length > 0 ? true : false,
                        child: Container(
                          height: 150.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: ItemEvents.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    ShowSectionDetaildailog(imagepathcharcter,
                                        ItemEvents[index].name);
                                  },
                                  child: ScotionWidget(
                                    name: ItemEvents[index].name,
                                    Imagepathsection: imagepathcharcter,
                                  ),
                                );
                              }),
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextData(Datashowed: 'RELATED LINKSE'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextDataWhitecolor(Datashowed: 'Detail'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextDataWhitecolor(Datashowed: 'Wikki'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextDataWhitecolor(Datashowed: 'Comicslinks'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
