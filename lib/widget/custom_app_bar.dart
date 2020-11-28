import 'package:flutter/material.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key,
    this.scrollOffset = 0.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black.withOpacity((scrollOffset/350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppbarButton(
                    title: "TV Shows",
                  ),
                  _AppbarButton(
                    title: "Movies",
                  ),
                  _AppbarButton(
                    title: "My List",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _AppbarButton extends StatelessWidget {
  final String title;
  _AppbarButton({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title,style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white
      ),),
    );
  }
}
