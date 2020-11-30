import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/cubit/app_bar_cubit.dart';
import 'package:flutter_netflix_responsive_ui/screen/nav_screen.dart';
import 'package:flutter_netflix_responsive_ui/widget/content_header.dart';
import 'package:flutter_netflix_responsive_ui/widget/content_list.dart';
import 'package:flutter_netflix_responsive_ui/widget/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/widget/previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super (key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      // setState(() {
      //   scrollOffset = _scrollController.offset;
      // });
      context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
    });
    super.initState();
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ScrollController _scrollController;
  //double scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("cast");
        },
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        // ignore: missing_required_param
        child: BlocBuilder<AppBarCubit,  double>(
          builder: (context, scrollOffset){
            return CustomAppBar(scrollOffset: scrollOffset );
          },
      )
      ),
      body: CustomScrollView(
        controller:  _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent : sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                title : "Previews",
                contentList : previews
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: "My List",
              contentList : myList
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                title: "Netflix Originals",
                contentList : originals,
              isOriginals : true
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                title: "Trending",
                contentList : trending
            ),
          ),
        ],
      ),
    );
  }


}
