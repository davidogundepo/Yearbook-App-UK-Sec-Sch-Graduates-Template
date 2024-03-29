import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_school.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../thrown_searches/year_11b_thrown_search.dart';
import '../api/year_11_class_b_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../notifier/year_11_class_b_notifier.dart';
import 'package:provider/provider.dart';
import '../details_pages/year_11b_details_page.dart';


String schoolName = "AAB Academy";
String thrownName = "Year 11B Class Graduates";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $schoolName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/hallel_12.jpg";

Color backgroundColor = Color.fromRGBO(143, 189, 211, 1);
Color appBarTextColor = Color.fromRGBO(63, 104, 124, 1.0);
Color appBarBackgroundColor = Color.fromRGBO(143, 189, 211, 1);
Color appBarIconColor = Color.fromRGBO(63, 104, 124, 1.0);
Color modalColor = Colors.transparent;
Color modalBackgroundColor = Color.fromRGBO(143, 189, 211, 1);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Color.fromRGBO(63, 104, 124, 1.0);
Color splashColor = Color.fromRGBO(143, 189, 211, 1);
Color splashColorTwo = Colors.black87;
Color iconColor = Color.fromRGBO(63, 104, 124, 1.0);
Color textColor = Color.fromRGBO(63, 104, 124, 1.0);
Color textColorTwo = Color.fromRGBO(63, 104, 124, 1.0);
Color dialogBackgroundColor = Color.fromRGBO(143, 189, 211, 1);
Color borderColor = Colors.black;
Color paintColor = Color.fromRGBO(143, 189, 211, 1);
Color paintColorTwo = Color.fromRGBO(143, 189, 211, 1);


class MyYear11ClassBPage extends StatefulWidget with NavigationStates{
  MyYear11ClassBPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyYear11ClassBPage createState() => _MyYear11ClassBPage();
}

class _MyYear11ClassBPage extends State<MyYear11ClassBPage> {

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    Year11ClassBNotifier year11ClassBNotifier = Provider.of<Year11ClassBNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
          splashColor: splashColor,
            onTap: () {
              year11ClassBNotifier.currentYear11ClassB = year11ClassBNotifier.year11ClassBList[index];
              navigateToYear11ClassBDetailsPage(context);
            },

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                              year11ClassBNotifier.year11ClassBList[index].image
                          ),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    year11ClassBNotifier.year11ClassBList[index].name,
                                    style: GoogleFonts.tenorSans(
                                        color: textColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600
                                    )
                                ),
                                (() {
                                  if (year11ClassBNotifier.year11ClassBList[index].prefect == "Yes") {
                                    return
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 10),
                                          Icon (
                                            MdiIcons.shieldCheck,
                                            color: iconColor,
                                          ),
                                        ],
                                      );
                                  } else {
                                    return Visibility(
                                      visible: !_isVisible,
                                      child: Icon (
                                        MdiIcons.shieldCheck,
                                        color: iconColor,
                                      ),
                                    );
                                  }
                                }()),
                              ],
                            ),

                          ),
                          (() {
                            if (year11ClassBNotifier.year11ClassBList[index].twitter.toString().isNotEmpty) {
                              if (!year11ClassBNotifier.year11ClassBList[index].twitter.toString().contains("@")) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      year11ClassBNotifier.year11ClassBList[index].twitter == year11ClassBNotifier.year11ClassBList[index].twitter ? '@'+year11ClassBNotifier.year11ClassBList[index].twitter : year11ClassBNotifier.year11ClassBList[index].twitter,
                                      style: GoogleFonts.varela(
                                          color: textColorTwo,
                                          fontStyle: FontStyle.italic
                                      )
                                  ),
                                );
                              }
                              else {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      year11ClassBNotifier.year11ClassBList[index].twitter,
                                      style: GoogleFonts.varela(
                                          color: textColorTwo,
                                          fontStyle: FontStyle.italic
                                      )
                                  ),
                                );
                              }
                            } else {
                              return Visibility(
                                visible: !_isVisible,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      year11ClassBNotifier.year11ClassBList[index].twitter,
                                      style: GoogleFonts.varela(
                                          color: textColorTwo,
                                          fontStyle: FontStyle.italic
                                      )
                                  ),
                                ),
                              );
                            }
                          }()),

                        ],
                      ),
                    )

                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),

            ),
            backgroundColor: dialogBackgroundColor,
            title: Text(exitAppTitle,
              style: TextStyle(
                  color: textColor
              ),
            ),
            content: Text(exitAppSubtitle,
              style: TextStyle(
                  color: textColor
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(exitAppNo,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text(exitAppYes,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
              ),
            ],
          ),
    ) ??
        false;
  }

  Future navigateToYear11ClassBDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Year11ClassBDetailsPage()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutSchoolDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutSchoolDetails()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    Year11ClassBNotifier year11ClassBNotifier = Provider.of<Year11ClassBNotifier>(context, listen: false);
    getYear11ClassB(year11ClassBNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Year11ClassBNotifier year11ClassBNotifier = Provider.of<Year11ClassBNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalColor,
                            context: context,
                            builder: (context) => Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: modalBackgroundColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColorTwo,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom, color: iconColor),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: iconColor),
                                        title: new Text(aboutSchool,
                                        style: GoogleFonts.zillaSlab(
                                          color: textColor
                                        ),),
                                        onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: iconColor),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor,
                                          ),),
                                        onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: year11ClassBNotifier.year11ClassBList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyYear11ClassBSearch(all: year11ClassBNotifier.year11ClassBList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Center(
                        heightFactor: 0.6,
                        child: Text(thrownName,
                            style: GoogleFonts.aBeeZee(
                              color: textColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                      background: Image.asset(imgAsset,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: year11ClassBNotifier.year11ClassBList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackGround extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Paint paint = new Paint();
  paint.color = paintColor;
  paint.strokeWidth = 100;
  paint.isAntiAlias = true;

  Paint paint2 = new Paint();
  paint2.color = paintColorTwo;
  paint2.strokeWidth = 100;
  paint2.isAntiAlias = true;

  canvas.drawLine(Offset(300, -120), Offset(size.width+60, size.width-280), paint2);
  canvas.drawLine(Offset(200, -80), Offset(size.width+60, size.width-160), paint);
  canvas.drawLine(Offset(100, -40), Offset(size.width+60, size.width-40), paint2);
  canvas.drawLine(Offset(0, 0), Offset(size.width+60, size.width+80), paint);
  canvas.drawLine(Offset(-100, 40), Offset(size.width+60, size.width+200), paint2);
  canvas.drawLine(Offset(-200, 90), Offset(size.width+60, size.width+320), paint);
  canvas.drawLine(Offset(-300, 140), Offset(size.width+60, size.width+440), paint2);
  canvas.drawLine(Offset(-400, 190), Offset(size.width+60, size.width+560), paint);
  canvas.drawLine(Offset(-500, 240), Offset(size.width+60, size.width+680), paint2);
  canvas.drawLine(Offset(-600, 290), Offset(size.width+60, size.width+800), paint);

//
//  var color = Paint();
//  color.color = Colors.green[800];
//  color.style = PaintingStyle.fill;
//
//  var create = Path();
//
//  create.moveTo(0, size.height * 0.9167);
//  create.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
//      size.width * 0.5, size.height * 0.9167);
//  create.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
//      size.width * 1.0, size.height * 0.9167);
//  create.lineTo(size.width, size.height);
//  create.lineTo(0, size.height);
//
//  canvas.drawPath(create, color);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
