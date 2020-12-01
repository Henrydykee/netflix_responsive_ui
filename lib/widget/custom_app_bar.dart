import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widget/responsive.dart';

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
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        )
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.netflixLogo1),
        const SizedBox(width: 12.0,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppbarButton(
                    title: "TV Shows",
                  ),
                  SizedBox(width: 10,),
                  _AppbarButton(
                    title: "Movies",
                  ),
                  SizedBox(width: 10,),
                  _AppbarButton(
                    title: "New & Popular",
                  ),
                  SizedBox(width: 10,),
                  _AppbarButton(
                    title: "My List",
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.white,size: 28.0,),
                  SizedBox(width: 25,),
                  Icon(Icons.card_giftcard, color: Colors.white, size: 28.0,),
                  SizedBox(width: 25,),
                  Icon(Icons.notifications, color: Colors.white,size: 28.0,),
                  SizedBox(width: 25,),
                  Icon(Icons.person, color: Colors.red,size: 28.0,),
                  SizedBox(width: 25,),
                ],
              ),
            ],
          ),
        )
      ],
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
