import 'package:flutter/material.dart';
import '../models/content_model.dart';
import 'vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
            right: 0,
            bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalButtons(
                icon: Icons.add,
                title: "List",
              ),
              _PlayButton(),
              VerticalButtons(
                icon: Icons.info_outline,
                title: "Info",
              )
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      color: Colors.white,
      icon: Icon(Icons.play_arrow, size: 30),
      label: Text(
        "Play",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600
        ),
      ), onPressed: () {
        print("");
    },
    );
  }
}

