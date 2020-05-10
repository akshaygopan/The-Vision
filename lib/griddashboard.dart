import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision/Music/Music.dart';
import 'package:vision/Navigation/navigation.dart';
import 'package:vision/message/message.dart';
import 'package:vision/todolist.dart';
import 'package:vision/Call.dart';


class Items {
  final String title;
  final String subtitle;
  final String event;
  final String img;
  final Widget navigateTo;
  Items({this.title, this.subtitle, this.event, this.img, this.navigateTo,});
}

class GridDashboard extends StatelessWidget {
  final Items item1 = new Items(
      title: "Call",
      subtitle: "Contacts",
      event: "",
      img: "assets/call.png",
      navigateTo: CallApp(),
  );

  final Items item2 = new Items(
    title: "Message",
    subtitle: "inbox",
    event: "",
    img: "assets/message.png",
    navigateTo: Message(),
  );
  final Items item3 = new Items(
    title: "Music",
    subtitle: "Listen to fav songs",
    event: "",
    img: "assets/music.png",
    navigateTo: Music(),
  );
  final Items item4 = new Items(
    title: "Navigation",
    subtitle: "select destination",
    event: "",
    img: "assets/navigation.png",
    navigateTo: Navigation(),
  );
  final Items item5 = new Items(
    title: "News",
    subtitle: "Today's highlights",
    event: "",
    img: "assets/news.png",
  );
  final Items item6 = new Items(
    title: "To Do List",
    subtitle: "",
    event: " ",
    img: "assets/todolist.png",
    navigateTo: ToDoList(),
  );
  
 @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff616161;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GridTile(
              child: InkResponse(
                child: Container(
                  decoration: BoxDecoration(color: Color(color), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 42,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.subtitle,
                        style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.event,
                        style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => data.navigateTo));
                }
              ),
            );
          }).toList()),
    );
  }
}