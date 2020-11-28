import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widget/content_header.dart';
import 'package:flutter_netflix_responsive_ui/widget/custom_app_bar.dart';

import '../data/data.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    super.initState();
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("cast");
        },
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        controller:  _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent : sintelContent),
          )
        ],
      ),
    );
  }


}
